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

  def proc(:init, NITRO.pi(state: state(value: v, opts: opts) = st) = pi) do
    v = :string.lowercase(v)

    index = Keyword.get(opts, :index, [])
      |> Enum.flat_map(
          fn (i) when is_function(i) -> [i];
             (i) -> [fn o -> :erlang.apply(:kvs, :field, [o,i]) end]
          end)

    cps = :binary.split(v, [" "], [:global,:trim_all]) 
        |> Enum.map(&:binary.compile_pattern(&1))

    opts = Keyword.put(opts, :index, index)
    opts = Keyword.put(opts, :cps, cps)

    send self(), {:filterComboValues, :init, v}

    {:ok, NITRO.pi(pi, state: state(st, opts: opts, lastMsg: :erlang.timestamp(), timer: ping(100)))}
  end

  def proc({:check}, NITRO.pi(state: state(timer: t, lastMsg: {_, sec, _}) = st) = pi) do
    :erlang.cancel_timer(t)
    case :erlang.timestamp() do
      {_, x, _} when x - sec >= 60 -> {:stop, :normal, NITRO.pi(pi, state: state(st, timer: []))}
      _ -> {:noreply, NITRO.pi(pi, state: state(st, timer: ping(10000)))}
    end
  end

  def proc({:filterComboValues, cmd, value0}, NITRO.pi(state: state(chunks: chunks, value: prev) = st) = pi) do
    state(uid: uid, feed: feed, reader: r, pid: pid, opts: opts) = st
    m     = Keyword.get(opts, :delegate, [])
    field = Keyword.get(opts, :field, [])
    index = Keyword.get(opts, :index, [])
    cps   = Keyword.get(opts, :cps, [])
    value = case cmd do :init -> value0; _ -> prev end

    cmd in [:init, :append] and 
      send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m)})

    r1 = :erlang.apply(:kvs, :take, [:erlang.apply(:kvs, :setfield, [r, :args, 10])])
    case :erlang.apply(:kvs, :field, [r1, :args]) do
      [] ->
        send(pid, {:direct, NITRO.comboInsert(uid: uid, dom: field, delegate: m, chunks: chunks, status: :finished)})
        send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m, status: :finished)})
        {:stop, :normal, NITRO.pi(pi, state: state(st, reader: :erlang.apply(:kvs, :setfield, [r1, :args, []])))}
      rows when value == "all" -> rows
      rows ->
        filtered = rows |>
          Enum.flat_map(fn row ->
            if index
              |> Enum.map(&(:string.lowercase(&1.(row))))
              |> Enum.filter(fn r -> cps |> Enum.all?(&:binary.match(r,&1,[]) != :nomatch) end)
              |> Enum.empty?, do: [], else: [row]
          end)

        newChunks = chunks + length(filtered)

        send(pid, {:direct, NITRO.comboInsert(uid: uid, dom: field, delegate: m, chunks: newChunks, feed: feed, rows: filtered)})

        if chunks < 50, do:  send(self(), {:filterComboValues, :continue, value0}),
        else: send(pid, {:direct, NITRO.comboLoader(dom: field, delegate: m, status: :finished)})

        {:noreply, NITRO.pi(pi, state: state(st, lastMsg: :erlang.timestamp(), value: value, chunks: newChunks, reader: :erlang.apply(:kvs, :setfield, [r1, :args, []])))}
    end
  end

  def proc(_, pi), do: {:noreply, pi}

  def ping(milliseconds), do: :erlang.send_after(milliseconds, self(), {:check})
end