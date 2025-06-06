defmodule FinancialappWeb.UserJSON do
  alias Financialapp.Account.User
  alias FinancialappWeb.TransactionJSON
  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{users: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{user: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end

  #defp transaction_data(%Transaction{} = transaction) do
  #  %{
  #    id: transaction.id,
  #    type: transaction.type,
  #    value: transaction.value,
  #    description: transaction.description,
  #  }
  #end
end
