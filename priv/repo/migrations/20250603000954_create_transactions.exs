defmodule Financialapp.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :description, :string
      add :value, :decimal
      add :type, :string
      add :date, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
