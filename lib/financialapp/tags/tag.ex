defmodule Financialapp.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string

    belongs_to :user, Financialapp.Account.User

    many_to_many :transactions, Financialapp.Transactions.Transaction,
    join_through: "transactions_tags",
    on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name])
  end
end
