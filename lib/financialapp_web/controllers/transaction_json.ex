defmodule FinancialappWeb.TransactionJSON do
  alias FinancialappWeb.TagJSON
  alias Financialapp.Transactions.Transaction

  @doc """
  Renders a list of transactions.
  """
  def index(%{transactions: transactions}) do
    %{transactions: for(transaction <- transactions, do: data(transaction))}
  end

  @doc """
  Renders a single transaction.
  """
  def show(%{transaction: transaction}) do
    %{transaction: data(transaction)}
  end

  def data(%Transaction{} = transaction) do
    %{
      id: transaction.id,
      description: transaction.description,
      value: transaction.value,
      type: transaction.type,
      date: transaction.date,
      user_id: transaction.user_id,
      tags: Enum.map(transaction.tags, &TagJSON.data/1)
      #render_many(transaction.tags, Financialapp.Tags, "tag.json")
      #Enum.map(user.transactions, &TransactionJSON.data/1)
    }
  end
end
