defmodule Financialapp.Repo do
  use Ecto.Repo,
    otp_app: :financialapp,
    adapter: Ecto.Adapters.Postgres
end
