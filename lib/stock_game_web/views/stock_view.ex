defmodule StockGameWeb.StockView do
  use StockGameWeb, :view
  alias StockGameWeb.StockView

  def render("index.json", %{stocks: stocks}) do
    %{data: render_many(stocks, StockView, "stock.json")}
  end

  def render("show.json", %{stock: stock}) do
    %{data: render_one(stock, StockView, "stock.json")}
  end

  def render("stock.json", %{stock: stock}) do
    %{id: stock.id,
      user_id: stock.user_id,
      ticker: stock.ticker,
      amt: stock.amt,
      pur_price: stock.pur_price}
  end
end
