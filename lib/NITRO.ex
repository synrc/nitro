defmodule NITRO do
  require Record

  files = Path.wildcard("include/**/*")

  hrl_files =
    Enum.filter(files, fn f ->
      !String.contains?(f, "/_") and Path.extname(f) == ".hrl"
    end)

  Enum.each(
    hrl_files,
    fn t ->
      Enum.each(
        Record.extract_all(from_lib: "nitro/" <> t),
        fn {name, definition} ->
          IO.inspect({name, definition, t})
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
