defmodule Financialapp.Repo.Migrations.AddUserIdToTags do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
