defmodule Hellophoenix.HelloController do
  use Hellophoenix.Web, :controller 

  def world(conn, %{"name" => name}) do
    render conn, "world.html", name: name
  end
end
