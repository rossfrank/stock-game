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
    msg = "https://api.polygon.io/v1/last/stocks/" <> stock <> "?apiKey=dHES5_4lab1dePZE1H60TFzlP3lMq_YJ_uiPbC"
    resp = HTTPoison.get!(msg)
    price = Poison.decode!(resp.body)["last"]["price"]
    %{id: stock,
      user_id: stock,
      ticker: stock,
      price: price}
  end
end
