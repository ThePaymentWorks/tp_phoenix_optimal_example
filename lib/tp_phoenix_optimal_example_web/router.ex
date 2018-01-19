defmodule TpPhoenixOptimalExampleWeb.Router do
  use TpPhoenixOptimalExampleWeb, :router

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

  scope "/", TpPhoenixOptimalExampleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/success", PageController, :success
  end

  # Other scopes may use custom stacks.
  scope "/api", TpPhoenixOptimalExampleWeb do
    pipe_through :api
    get "/optimal/:payment_ref", OptimalController, :resolve_transaction
    get "/optimalStatus/:payment_ref", OptimalController, :transaction_status
  end
end
