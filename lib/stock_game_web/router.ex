defmodule StockGameWeb.Router do
  use StockGameWeb, :router

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

  scope "/", StockGameWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", StockGameWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/stocks", StockController, except: [:new, :edit]
  end
end
