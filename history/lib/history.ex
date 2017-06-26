defmodule History do
  use Application
  require Logger

  def start(_type, _args) do
    config = %History.Config{}
    History.start_server(config.port)
  end

  def start_server(port) do
   children = [
     Plug.Adapters.Cowboy.child_spec(:http, History.WebServer, [], port: port)
   ]

   Logger.info "Started application on #{port}"

   Supervisor.start_link(children, strategy: :one_for_one)
 end
end
