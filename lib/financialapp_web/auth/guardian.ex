defmodule FinancialappWeb.Auth.Guardian do
  use Guardian, otp_app: :financialapp
  alias Financialapp.Account

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :no_id_provided}
  end

  def resource_from_claims(%{"sub" => id}) do
    case Account.get_user!(id) do
      nil -> {:error, :not_found}
      resource -> {:ok, resource}
    end
  end

  def resource_from_claims(_claims) do
    {:error, :no_id_provided}
  end

  def authenticate(email, to_compare_password) do
    case Account.get_account_by_email(email) do
      nil -> {:error, :unauthorized}
      account ->
        case validate_password(to_compare_password, account.password) do
          true -> create_token(account)
          false -> {:error, :unauthorized}
        end
    end
  end

  defp validate_password(to_compare_password, password) do
    Bcrypt.verify_pass(to_compare_password, password)
  end

  defp create_token(account) do
    {:ok, token, _claims} = encode_and_sign(account)
    {:ok, account, token}
  end
end
