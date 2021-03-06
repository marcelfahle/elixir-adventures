defmodule MediumPhxExample.Web.Router do
  use MediumPhxExample.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MediumPhxExample.Web do
    pipe_through :api
  end
end
