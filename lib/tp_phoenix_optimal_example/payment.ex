defmodule TpPhoenixOptimalExample.Payment do
  alias TpPhoenixOptimalExample.Payment

  defstruct transaction: %{status: :none, errorCode: :none, errorMessage: :none}, transaction_status: :pending

  def start_link(name),
    do: Agent.start_link(fn -> %Payment{} end, name: name)

  def status?(ref),
    do: Agent.get(ref, fn state -> state.transaction_status end)

  def put_payment(ref, %Payment{} = payment),
    do: Agent.update(ref, fn _ -> Map.put(payment, :transaction_status, :fufilled) end)

  def put_payment(_,_),
    do: {:error, "payment_object_invalid"}

  def get_result(ref),
    do: Agent.get(ref, fn state -> state.transaction end)
end
