defmodule NITRO.Combo.Search do
  require NITRO
  require Record

  Record.defrecord(:state, lastMsg: [], timer: [], uid: [], pid: [], chunks: 0, value: [], reader: [], opts: [], feed: [])

  def start(uid, value, field, feed0, opts) do
    feed = :nitro.to_binary(feed0)
    state = state(uid: uid, pid: self(), value: value, reader: :erlang.apply(:kvs, :reader, [feed]), opts: opts, feed: feed)
    stop(uid, field)
    pi =
      NITRO.pi(
        module: NITRO.Combo.Search,
        table: :async,
        state: state,
        name: "comboSearch#{uid}",
        timeout: :brutal_kill,
        restart: :temporary
      )
    pid = :erlang.spawn_link(:nitro_pi, :start_link, [pi])
    :nitro_pi.cache(:async,{:async,"comboSearch#{uid}"},pid,:infinity)
    Process.unlink(pid)
  end

  def stop(uid, _field) do
    case :nitro_pi.pid(:async, "comboSearch#{uid}") do
      [] -> :ok
      pid ->
        :erlang.exit(pid, :kill)
        :nitro_pi.cache(:async, {:async, "comboSearch#{uid}"}, :undefined)
    end
  end

  def comboScroll(NITRO.comboScroll(uid: uid)) do
    case :nitro_pi.pid(:async, "comboSearch#{uid}") do
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

  def proc(:init, NITRO.pi(state: state(value: v) = st) = pi) do
    send(self(), {:filterComboValues, :init, v})
    {:ok, NITRO.pi(pi, state: state(st, lastMsg: :erlang.timestamp(), timer: ping(100)))}
  end

  def proc({:check}, NITRO.pi(state: state(timer: t, lastMsg: {_, sec, _}) = st) = pi) do
    :erlang.cancel_timer(t)
    case :erlang.timestamp() do
      {_, x, _} when x - sec >= 60 -> {:stop, :normal, NITRO.pi(pi, state: state(st, timer: []))}
      _ -> {:noreply, NITRO.pi(pi, state: state(st, timer: ping(10000)))}
    end
  end

  def proc({:filterComboValues, cmd, value0}, NITRO.pi(state: state(chunks: chunks) = st) = pi) do
    state(uid: uid, feed: feed, reader: r, value: prev, pid: pid, opts: opts) = st
    m = Keyword.get(opts, :delegate, [])
    field = Keyword.get(opts, :field, [])
    value = case cmd do :append -> prev; _ -> :string.lowercase(:unicode.characters_to_list(value0, :unicode)) end
    r1 = :erlang.apply(:kvs, :take, [:erlang.apply(:kvs, :setfield, [r, :args, 10])])
    case :erlang.apply(:kvs, :field, [r1, :args]) do
      [] ->
        send(pid, {:direct, NITRO.comboInsert(uid: uid, dom: field, delegate: m, chunks: chunks, status: :finished)})
        {:stop, :normal, NITRO.pi(pi, state: state(st, reader: :erlang.apply(:kvs, :setfield, [r1, :args, []])))}
      rows ->
        filtered =
          case value do
            'all' -> rows
            _ ->
              vals = :string.split(:string.trim(value), " ", :all)
              if length(vals) > 1, do:
                :lists.filter(fn x -> :lists.all(fn v ->:lists.any(&filter(v, x, &1), Keyword.get(opts, :index, [])) end, vals) end, rows),
              else:
                :lists.filter(fn x -> :lists.any(&filter(value, x, &1), Keyword.get(opts, :index, [])) end, rows)
          end
        newChunks = chunks + length(filtered)
        send(pid, {:direct, NITRO.comboInsert(uid: uid, dom: field, delegate: m, chunks: newChunks, feed: feed, rows: filtered)})
        chunks < 100 and
          case :nitro_pi.pid(:async, "comboSearch#{uid}") do [] -> []; pid -> send(pid, {:filterComboValues, cmd, value0}) end
        {:noreply, NITRO.pi(pi, state: state(st, lastMsg: :erlang.timestamp(), value: value, chunks: newChunks, reader: :erlang.apply(:kvs, :setfield, [r1, :args, []])))}
    end
  end

  def proc(_, pi), do: {:noreply, pi}

  def ping(milliseconds), do: :erlang.send_after(milliseconds, self(), {:check})

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