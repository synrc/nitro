defmodule NITRO do
  require Record
  import  Record, only: [defrecord: 2, extract: 2]
  defrecord :button,  extract(:button, from_lib: "nitro/include/nitro.hrl")
  defrecord :upload,  extract(:upload, from_lib: "nitro/include/nitro.hrl")
  defrecord :h2,      extract(:h2,     from_lib: "nitro/include/nitro.hrl")
  defrecord :message, extract(:button, from_lib: "nitro/include/nitro.hrl")
  defrecord :author,  extract(:upload, from_lib: "nitro/include/nitro.hrl")
end
