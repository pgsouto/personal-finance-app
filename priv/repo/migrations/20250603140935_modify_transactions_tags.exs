defmodule Financialapp.Repo.Migrations.ModifyTransactionsTags do
  use Ecto.Migration

  def change do
    alter table(:transactions_tags) do
      modify :inserted_at, :naive_datetime, null: true
      modify :updated_at, :naive_datetime, null: true
    end
  end
end
