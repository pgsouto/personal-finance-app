defmodule Financialapp.Repo.Migrations.AddUserIdToTransactions do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
