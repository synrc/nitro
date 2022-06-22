defmodule NITRO do
  require Record

  files = ["calendar.hrl", "nitro.hrl", "comboLookup.hrl", "nitro_pi.hrl", "comboLookupVec.hrl", "comboLookupEdit.hrl",
           "comboLookupText.hrl", "comboLookupModify.hrl", "comboLookupModify_item.hrl", "koatuuControl.hrl", "n2o.hrl"]

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
