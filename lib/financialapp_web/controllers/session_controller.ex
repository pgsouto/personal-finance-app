defmodule FinancialappWeb.SessionController do
  use FinancialappWeb, :controller

  alias FinancialappWeb.Auth.Guardian

  @doc """
  Realiza login com email e senha, retorna JWT se for bem-sucedido.
  """
  def login(conn, %{"email" => email, "password" => password}) do
    case Guardian.authenticate(email, password) do
      {:ok, user, token} ->
        conn
        |> put_status(:ok)
        |> json(%{
          message: "Login realizado com sucesso",
          token: token,
          user: %{
            id: user.id,
            name: user.name,
            email: user.email
          }
        })

      {:error, :unauthorized} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Email ou senha inválidos"})
    end
  end
end
