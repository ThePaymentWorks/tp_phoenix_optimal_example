defmodule TpPhoenixOptimalExampleWeb.PageController do
  use TpPhoenixOptimalExampleWeb, :controller
  alias TpPhoenixOptimalExample.Optimal

  def index(conn, _params) do
    # Create a new order
    {:ok, %HTTPoison.Response{body: body}} = Optimal.create_order

    # Retrieve the uri from the struct
    {:ok, %{"link" => [%{"uri" => uri}|_]}} = Poison.decode(body)

    render(conn, "index.html", uri: uri)
  end

  def success_redirect(conn, %{"transaction" => transaction}) do
    render(conn, "success_redirect.html", transaction: transaction)
  end

  def error_redirect(conn, %{"transaction" => transaction}) do
    render(conn, "error_redirect.html", transaction: transaction)
  end

  def success_callback(conn, %{"transaction" => transaction}) do
    IO.inspect transaction
    render(conn, "index.json", %{})
  end

  def error_callback(conn, %{"transaction" => transaction}) do
    IO.inspect transaction
    render(conn, "index.json", %{})
  end
end
