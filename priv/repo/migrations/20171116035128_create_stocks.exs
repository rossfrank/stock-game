defmodule StockGame.Repo.Migrations.CreateStocks do
  use Ecto.Migration

  def change do
    create table(:stocks) do
      add :ticker, :string
      add :amt, :integer
      add :pur_price, :decimal, precision: 12, scale: 2
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:stocks, [:user_id])
  end
end
