defmodule StockGameWeb.PageController do
  use StockGameWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
