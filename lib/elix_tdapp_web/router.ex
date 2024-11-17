# lib/elix_tdapp_web/router.ex
defmodule ElixTdappWeb.Router do
  use ElixTdappWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ElixTdappWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ElixTdappWeb do
    pipe_through :browser

    live "/", TodoLive
  end
end
