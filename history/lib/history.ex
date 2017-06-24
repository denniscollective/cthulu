defmodule History do
  use Application
  require Logger

  def start(_type, _args) do
   config = %History.Config{}

   children = [
     Plug.Adapters.Cowboy.child_spec(:http, History.WebServer, [],
     port: config.port)
   ]

   Logger.info "Started application on #{config.port}"

   Supervisor.start_link(children, strategy: :one_for_one)
 end
end
