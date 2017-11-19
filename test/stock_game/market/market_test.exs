defmodule StockGame.MarketTest do
  use StockGame.DataCase

  alias StockGame.Market

  describe "stocks" do
    alias StockGame.Market.Stock

    @valid_attrs %{amt: 42, pur_price: "120.5", ticker: "some ticker"}
    @update_attrs %{amt: 43, pur_price: "456.7", ticker: "some updated ticker"}
    @invalid_attrs %{amt: nil, pur_price: nil, ticker: nil}

    def stock_fixture(attrs \\ %{}) do
      {:ok, stock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Market.create_stock()

      stock
    end

    test "list_stocks/0 returns all stocks" do
      stock = stock_fixture()
      assert Market.list_stocks() == [stock]
    end

    test "get_stock!/1 returns the stock with given id" do
      stock = stock_fixture()
      assert Market.get_stock!(stock.id) == stock
    end

    test "create_stock/1 with valid data creates a stock" do
      assert {:ok, %Stock{} = stock} = Market.create_stock(@valid_attrs)
      assert stock.amt == 42
      assert stock.pur_price == Decimal.new("120.5")
      assert stock.ticker == "some ticker"
    end

    test "create_stock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Market.create_stock(@invalid_attrs)
    end

    test "update_stock/2 with valid data updates the stock" do
      stock = stock_fixture()
      assert {:ok, stock} = Market.update_stock(stock, @update_attrs)
      assert %Stock{} = stock
      assert stock.amt == 43
      assert stock.pur_price == Decimal.new("456.7")
      assert stock.ticker == "some updated ticker"
    end

    test "update_stock/2 with invalid data returns error changeset" do
      stock = stock_fixture()
      assert {:error, %Ecto.Changeset{}} = Market.update_stock(stock, @invalid_attrs)
      assert stock == Market.get_stock!(stock.id)
    end

    test "delete_stock/1 deletes the stock" do
      stock = stock_fixture()
      assert {:ok, %Stock{}} = Market.delete_stock(stock)
      assert_raise Ecto.NoResultsError, fn -> Market.get_stock!(stock.id) end
    end

    test "change_stock/1 returns a stock changeset" do
      stock = stock_fixture()
      assert %Ecto.Changeset{} = Market.change_stock(stock)
    end
  end
end
