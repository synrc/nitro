defmodule NITRO do
  require Record

  files = ["calendar.hrl", "nitro.hrl", "comboLookup.hrl",
           "comboLookupVec.hrl", "comboLookupEdit.hrl", "koatuuControl.hrl"]

  hrl_files =
    Enum.filter(files, fn f ->
      !String.contains?(f, "/_") and Path.extname(f) == ".hrl"
    end)

  Enum.each(
    hrl_files,
    fn t ->
      Enum.each(
        Record.extract_all(from_lib: "nitro/include/" <> t),
        fn {name, definition} ->
#          IO.inspect({name, definition, t})
          prev = :application.get_env(:kernel, :nitro_tables, [])

          case :lists.member(name, prev) do
            true ->
              :skip

            false ->
              Record.defrecord(name, definition)
              :application.set_env(:kernel, :nitro_tables, [name | prev])
          end
        end
      )
    end
  )

end
