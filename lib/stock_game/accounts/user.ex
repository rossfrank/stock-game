defmodule StockGame.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias StockGame.Accounts.User


  schema "users" do
    field :money, :decimal
    field :username, :string
    field :stocks, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :money])
    |> validate_required([:username])
  end
end
