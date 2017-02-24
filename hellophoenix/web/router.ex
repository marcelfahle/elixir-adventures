defmodule Hellophoenix.Router do
  use Hellophoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hellophoenix do
    pipe_through :browser # Use the default browser stack

    get "/hello/:name", HelloController, :world
    get "/", PageController, :index
  end

  #scope "ApisList/getRoomSearch?UserId=11553", 

  # Other scopes may use custom stacks.
  # scope "/api", Hellophoenix do
  #   pipe_through :api
  # end
end
