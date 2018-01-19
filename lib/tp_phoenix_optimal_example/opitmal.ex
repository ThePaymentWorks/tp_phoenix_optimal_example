defmodule TpPhoenixOptimalExample.Optimal do
  alias TpPhoenixOptimalExample.Optimal.SuccessOrder

  @url "http://localhost:8000/#{Map.fetch!(System.get_env(), "TP_KEY")}/optimal/v1/orders/"

  def create_order do
    # Get an example order struct
    {:ok, params} = Poison.encode(%SuccessOrder{})

    # Create a new order
    HTTPoison.post(@url, params)
  end
end
