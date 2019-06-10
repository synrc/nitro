defmodule NITRO do
  require Record
  import  Record, only: [defrecord: 2, extract: 2]
  defrecord :button,  extract(:button,  from_lib: "nitro/include/nitro.hrl")
  defrecord :upload,  extract(:upload,  from_lib: "nitro/include/nitro.hrl")
  defrecord :h2,      extract(:h2,      from_lib: "nitro/include/nitro.hrl")
  defrecord :message, extract(:message, from_lib: "nitro/include/nitro.hrl")
  defrecord :author,  extract(:author,  from_lib: "nitro/include/nitro.hrl")
  defrecord :jq,      extract(:jq,      from_lib: "nitro/include/nitro.hrl")
end
