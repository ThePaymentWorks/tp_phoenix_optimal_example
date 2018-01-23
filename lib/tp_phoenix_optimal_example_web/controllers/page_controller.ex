defmodule TpPhoenixOptimalExampleWeb.PageController do
  use TpPhoenixOptimalExampleWeb, :controller
  alias TpPhoenixOptimalExample.Optimal

  def index(conn, _params) do
    # Create a new order
    {:ok, %HTTPoison.Response{body: body}} = Optimal.create_order()
    render_index(conn, Poison.decode(body))
  end

  # Retrieve the uri from the struct
  def render_index(conn, {:ok, %{"link" => [%{"uri" => uri}|_]}}),
    do: render(conn, "index.html", data: %{"uri" => uri})

  def render_index(conn, {:ok, %{"error" => error}}),
    do: render(conn, "index.html", data: %{"error" => error})

  def success_redirect(conn, %{"transaction" => transaction}),
    do: render(conn, "success_redirect.html", data: %{"transaction" => transaction})

  def error_redirect(conn, %{"transaction" => transaction}),
    do: render(conn, "error_redirect.html", data: %{"transaction" => transaction})

  def success_callback(conn, %{"transaction" => transaction}),
    do: render(conn, "index.json", %{})

  def error_callback(conn, %{"transaction" => transaction}),
    do: render(conn, "index.json", %{})
end
