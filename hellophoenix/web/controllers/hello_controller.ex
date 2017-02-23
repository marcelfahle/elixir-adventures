defmodule Hellophoenix.HelloController do
  use Hellophoenix.Web, :controller 

  def world(conn, _params) do
    render conn, "world.html"
  end
end
