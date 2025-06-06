defmodule FinancialappWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :financialapp,
    module: FinancialappWeb.Auth.Guardian,
    error_handler: FinancialappWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.LoadResource, allow_blank: false
  plug :set_current_user

  defp set_current_user(conn, _) do
    case Guardian.Plug.current_resource(conn) do
      nil -> conn
      user -> assign(conn, :current_user, user)
    end
  end
end
