defmodule NITRO.Combo.Search do
  require NITRO
  require Record

  Record.defrecord(:state, lastMsg: [], timer: [], uid: [], pid: [], chunks: 0, value: [], reader: [], opts: [], feed: [])

  def start(uid, value, field, feed0, opts) do
    feed = :nitro.to_binary(feed0)
    state = state(uid: uid, pid: self(), value: value,  opts: opts, feed: feed)
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

  def keyUp(NITRO.comboKey(uid: uid, value: "stop")) do 
    case :nitro_pi.pid(:async, "comboSearch#{uid}") do
      [] -> []
      pid ->
        send pid, {:stop, uid, self()}
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
    send(self(), {:direct, NITRO.comboLoader(dom: field, delegate: module, status: :finished)})
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

  def proc(:init, NITRO.pi(state: state(value: v, opts: opts, feed: feed, pid: pid) = st) = pi) do
    reader = :erlang.apply(:kvs, :reader, [feed])
    m     = Keyword.get(opts, :delegate, [])
    field = Keyword.get(opts, :field, [])
    index = Keyword.get(opts, :index, [])

    cpx = case NITRO.Combo.has_function(m, :patterns) do
      true ->
        m.patterns(:string.lexemes(v, [32]))
      false ->
        value_cps = :binary.split(:string.lowercase(v), [" "], [:global,:trim_all]) 
          |> Enum.map(&:binary.compile_pattern(&1))

        input_cp = index
          |> Enum.flat_map(
               fn (i) when is_function(i) -> [i];
                  (i) -> [fn o -> :erlang.apply(:kvs, :field, [o,i]) end]
               end)
          |> Enum.map(fn i -> {i, value_cps} end)

        {input_cp, []}
    end

    opts = Keyword.put(opts, :cpx, cpx)

    v = :string.lowercase(v)
    send self(), {:filterComboValues, :init, v}

    send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m)})

    {:ok, NITRO.pi(pi, state: state(st, opts: opts, reader: reader, lastMsg: :erlang.timestamp(), timer: ping(100)))}
  end

  def proc({:check}, NITRO.pi(state: state(timer: t, lastMsg: {_, sec, _}) = st) = pi) do
    :erlang.cancel_timer(t)
    case :erlang.timestamp() do
      {_, x, _} when x - sec >= 60 -> {:stop, :normal, NITRO.pi(pi, state: state(st, timer: []))}
      _ -> {:noreply, NITRO.pi(pi, state: state(st, timer: ping(10000)))}
    end
  end

  def proc({:stop, _uid, _ref}, NITRO.pi(state: state(opts: opts, pid: pid)) = pi) do
    m  = Keyword.get(opts, :delegate, [])
    field = Keyword.get(opts, :field, [])

    send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m, status: :finished)})

    {:stop, :normal, pi}
  end

  def proc({:filterComboValues, cmd, value0}, NITRO.pi(state: state(chunks: chunks, value: prev) = st) = pi) do
    state(uid: uid, feed: feed, reader: r, pid: pid, opts: opts) = st
    m     = Keyword.get(opts, :delegate, [])
    field = Keyword.get(opts, :field, [])
    {cpv, cpe}   = Keyword.get(opts, :cpx, {[],[]})

    value = case cmd do :init -> value0; _ -> prev end

    if cmd in [:append] do
      send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m, status: :finished)})
      send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m)})
    end

    r1 = :erlang.apply(:kvs, :take, [:erlang.apply(:kvs, :setfield, [r, :args, 50])])
    case :erlang.apply(:kvs, :field, [r1, :args]) do
      [] ->
        send(pid, {:direct, NITRO.comboInsert(uid: uid, dom: field, delegate: m, chunks: chunks, status: :finished)})
        send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m, status: :finished)})

        {:stop, :normal, NITRO.pi(pi, state: state(st, reader: :erlang.apply(:kvs, :setfield, [r1, :args, []])))}
      rows when cpe != [] or cpv != []->
        filter_val = fn patterns, r ->
          if patterns
            |> Enum.map(&{elem(&1,0).(r), elem(&1,1)})
            |> Enum.map(&{:nitro.to_binary(elem(&1,0)),elem(&1,1)})
            |> Enum.map(&{:string.lowercase(elem(&1,0)),elem(&1,1)})
            |> Enum.filter(fn {v1,cps} ->
                cps |> Enum.all?(&:binary.match(v1,&1,[]) != :nomatch)
               end)
            |> Enum.empty?, do: [], else: [r]
        end

        filtered = if value == "all", do: rows, else: rows |>
          Enum.flat_map(fn (row) when cpe == [] -> filter_val.(cpv, row)
            (row) ->
              if cpe
                |> Enum.reduce_while([row], fn {f,c}, acc ->
                    if :binary.match(f.(row), c, []) == :nomatch, do: {:halt, []}, else: {:cont,acc}
                   end)
                |> Enum.flat_map(&filter_val.(cpv, &1))
                |> Enum.empty?, do: [], else: [row]
          end)

        newChunks = chunks + length(filtered)

        send(pid, {:direct, NITRO.comboInsert(uid: uid, dom: field, delegate: m, chunks: newChunks, feed: feed, rows: filtered)})

        if chunks < 50, do:  send(self(), {:filterComboValues, :continue, value0}),
        else: send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m, status: :finished)})

        reader = :erlang.apply(:kvs, :setfield, [r1, :args, []])

        {:noreply, NITRO.pi(pi, state: state(st, lastMsg: :erlang.timestamp(), value: value, chunks: newChunks, reader: reader))}
      _ ->
        send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m, status: :finished)})
        {:noreply, NITRO.pi(pi, state: state(st, lastMsg: :erlang.timestamp(), value: value))}
    end
  end

  def proc(_, pi), do: {:noreply, pi}

  def ping(milliseconds), do: :erlang.send_after(milliseconds, self(), {:check})
end