defmodule StockGameWeb.UserView do
  use StockGameWeb, :view
  alias StockGameWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      stock: [%{name: "NVDA", price: 100}, %{name: "FB", price: 99}]}
  end
end
