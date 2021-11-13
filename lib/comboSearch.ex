defmodule NITRO.Combo.Search do
  require NITRO
  require Record

  Record.defrecord(:state, uid: [], pid: [], chunks: 0, value: [], reader: [], opts: [], feed: [])

  def start(uid, value, field, feed, opts) do
    Supervisor.start_link([], strategy: :one_for_one, name: NITRO.Combo.Search)
    state = state(uid: uid, pid: self(), value: value, reader: :erlang.apply(:kvs, :reader, [feed]), opts: opts, feed: feed)
    stop(uid, field)
    pi =
      NITRO.pi(
        module: NITRO.Combo.Search,
        table: :async,
        sup: NITRO.Combo.Search,
        state: state,
        name: "#{uid}#{field}",
        timeout: :brutal_kill,
        restart: :temporary
      )
    case :nitro_pi.start(pi) do
      {pid,_} -> send(pid, {:filterComboValues, :init, value})
      x -> x
    end
  end

  def stop(uid, field) do
    case :nitro_pi.pid(:async, "#{uid}#{field}") do
      [] -> :ok
      pid ->
        :erlang.exit(pid, :kill)
         try do :nitro_pi.stop(:async, "#{uid}#{field}") catch _,_ -> :skip end
    end
  end

  def comboScroll(NITRO.comboScroll(uid: uid, dom: field)) do
    case :nitro_pi.pid(:async, "#{uid}#{field}") do
      [] -> []
      pid -> send(pid, {:filterComboValues, :append, []})
    end
  end

  def keyUp(NITRO.comboKey(uid: uid, value: value, dom: field, feed: feed, delegate: module)) do
    opts = [index: NITRO.Combo.index(module), field: field, delegate: module]
    comboContainer = :nitro.atom([:comboContainer, :nitro.to_list(field)])
    :nitro.display(:nitro.atom([:comboContainer, field]), :block)
    :nitro.clear(comboContainer)
    :nitro.wire("comboCloseFormById('#{:nitro.atom([:nitro.to_list(field), 'form'])}');")
    :nitro.wire("comboLookupChange('#{field}');")
    :nitro.wire(NITRO.bind(target: :nitro.to_binary(comboContainer), type: :scroll, postback: onscroll(uid, field, module)))
    start(uid, value, field, feed, opts)
  end

  def onscroll(uid, field, delegate), do:
    :erlang.iolist_to_binary([
      "if (event.target && (event.target.scrollTop + event.target.offsetHeight + 10 >= event.target.scrollHeight)) {",
        "ws.send(enc(tuple(atom('direct'),
         tuple(atom('comboScroll'),",
            "bin('#{uid}'),",
            "bin('#{field}'),",
            "atom('#{delegate}'))",
        ")));",
      "}"
    ])

  def proc(:init, NITRO.pi() = pi), do: {:ok, pi}

  def proc({:filterComboValues, cmd, value0}, NITRO.pi(state: state(chunks: chunks) = st) = pi) do
    state(uid: uid, feed: feed, reader: r, value: prev, pid: pid, opts: opts) = st
    m = Keyword.get(opts, :delegate, [])
    field = Keyword.get(opts, :field, [])
    value = case cmd do :append -> prev; _ -> :string.lowercase(:unicode.characters_to_list(value0, :unicode)) end
    r1 = :erlang.apply(:kvs, :take, [:erlang.apply(:kvs, :setfield, [r, :args, 10])])
    case :erlang.apply(:kvs, :field, [r1, :args]) do
      [] ->
        send(pid, {:direct, NITRO.comboInsert(dom: field, delegate: m, chunks: chunks, status: :finished)})
        {:stop, :normal, NITRO.pi(pi, state: state(st, reader: :erlang.apply(:kvs, :setfield, [r1, :args, []])))}
      rows ->
        filtered =
          case value do
            'all' -> rows
            _ ->
              :lists.filter(fn x -> :lists.any(&filter(value, x, &1), Keyword.get(opts, :index, [])) end, rows)
          end
        newChunks = chunks + length(filtered)
        send(pid, {:direct, NITRO.comboInsert(dom: field, delegate: m, chunks: newChunks, feed: feed, rows: filtered)})
        chunks < 100 and
          case :nitro_pi.pid(:async, "#{uid}#{field}") do [] -> []; pid -> send(pid, {:filterComboValues, cmd, value0}) end
        {:noreply, NITRO.pi(pi, state: state(st, value: value, chunks: newChunks, reader: :erlang.apply(:kvs, :setfield, [r1, :args, []])))}
    end
  end

  def proc(_, pi), do: {:noreply, pi}

  defp filter(val, obj, i) do
    fld =
      if is_function(i) do
        i.(obj)
      else
        fldVal = :erlang.apply(:kvs, :field, [obj, i])
        if fldVal == elem(obj, 0), do: :nitro.to_list(fldVal), else: fldVal
      end |> NITRO.Combo.to_list()
    fld != elem(obj, 0) and :string.rstr(:string.lowercase(:nitro.to_list(fld)), val) > 0
  end
end