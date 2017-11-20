defmodule StockGameWeb.UserView do
  use StockGameWeb, :view
  alias StockGameWeb.UserView
  alias StockGameWeb.StockController

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      stock: Enum.map(user.stocks, fn stock -> msg = "https://api.polygon.io/v1/last/stocks/" <> stock <> "?apiKey=dHES5_4lab1dePZE1H60TFzlP3lMq_YJ_uiPbC"
      resp = HTTPoison.get!(msg)
      price = Poison.decode!(resp.body)["last"]["price"]
      %{name: stock,
        price: price} end)}
  end
end
