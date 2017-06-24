defmodule History.WebServer do
  @moduledoc """
  Documentation for History.
  """

  @doc """
  Hello world.

  ## Examples

      iex> History.hello
      :world

  """

  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Herstory repeats itself.")
  end
end
