defmodule NITRO do
  require Record

  Enum.each(Record.extract_all(from_lib: "nitro/include/nitro.hrl"), fn {name, definition} ->
    Record.defrecord(name, definition)
  end)
end
