defmodule Financialapp.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Financialapp.Account` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        password: "some password"
      })
      |> Financialapp.Account.create_user()

    user
  end
end
