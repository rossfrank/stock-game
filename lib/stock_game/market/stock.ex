defmodule StockGame.Market.Stock do
  use Ecto.Schema
  import Ecto.Changeset
  alias StockGame.Market.Stock


  schema "stocks" do
    field :amt, :integer
    field :pur_price, :decimal
    field :ticker, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Stock{} = stock, attrs) do
    stock
    |> cast(attrs, [:ticker, :amt, :pur_price])
    |> validate_required([:ticker, :user_id])
  end
end
