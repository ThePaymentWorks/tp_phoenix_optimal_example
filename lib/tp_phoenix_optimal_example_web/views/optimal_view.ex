defmodule TpPhoenixOptimalExampleWeb.OptimalView do
  use TpPhoenixOptimalExampleWeb, :view

  def render("pending.json", _),
    do: %{status: "pending"}

  def render("fufilled.json", %{data: transaction}),
    do: %{transaction: transaction}
end
