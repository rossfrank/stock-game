defmodule StockGame.Repo.Migrations.AddStockToUser do
  use Ecto.Migration

  def change do
	alter table(:users) do
		add :stocks, {:array, :string}
	end
  end
end
