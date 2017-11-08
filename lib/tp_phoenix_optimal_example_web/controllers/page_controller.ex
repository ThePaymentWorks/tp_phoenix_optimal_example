defmodule TpPhoenixOptimalExampleWeb.PageController do
  use TpPhoenixOptimalExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def success(conn, _params) do
    render conn, "index.html"
  end
end
