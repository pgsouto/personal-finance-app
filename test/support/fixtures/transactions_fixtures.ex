defmodule Financialapp.TransactionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Financialapp.Transactions` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        date: ~U[2025-06-02 00:09:00Z],
        description: "some description",
        type: "some type",
        value: "120.5"
      })
      |> Financialapp.Transactions.create_transaction()

    transaction
  end
end
