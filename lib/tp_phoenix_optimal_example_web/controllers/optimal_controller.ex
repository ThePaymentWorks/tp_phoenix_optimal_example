defmodule TpPhoenixOptimalExampleWeb.OptimalController do
  use TpPhoenixOptimalExampleWeb, :controller

  alias TpPhoenixOptimalExample.Payment

  def resolve_transaction(conn, %{"payment_ref" => payment_ref, "transaction" => transaction}) do
    ref = String.to_atom(payment_ref)

    Payment.start_link(ref)
    Payment.put_payment(ref, %Payment{transaction: transaction})

    redirect(conn, to: page_path(conn, :index))
  end

  @doc """
  transaction_status/2

  This function will return the status for the current payment. It will handle the
  following scenarios.

  - If the payment ref is a string (binary in erlang) we will convert it to an atom
  - We will attempt to start a new Payment Process using the paymentRef from the url
  - We will handle the result of start_link incase the process already exsits
  - We will return the current transaction status
  """
  def transaction_status(conn, %{"payment_ref" => ref}) when is_binary(ref),
    do: transaction_status(conn, %{"payment_ref" => String.to_atom(ref)})

  def transaction_status(conn, %{"payment_ref" => ref}),
    do: transaction_status(conn, Payment.start_link(ref))

  def transaction_status(conn, {:error, {:already_started, pid}}),
    do: transaction_status(conn, pid)

  def transaction_status(conn, {:ok, pid}),
    do: transaction_status(conn, pid)

  def transaction_status(conn, ref),
    do: transaction_status(conn, Payment.status?(ref), Payment.get_result(ref))

  # transaction_status/3
  # Call the correct view
  def transaction_status(conn, :pending, _),
    do: render(conn, "pending.json", data: %{})
  def transaction_status(conn, :fufilled, transaction),
    do: render(conn, "fufilled.json", data: transaction)
end
