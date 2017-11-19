defmodule StockGameWeb.StockControllerTest do
  use StockGameWeb.ConnCase

  alias StockGame.Market
  alias StockGame.Market.Stock

  @create_attrs %{amt: 42, pur_price: "120.5", ticker: "some ticker"}
  @update_attrs %{amt: 43, pur_price: "456.7", ticker: "some updated ticker"}
  @invalid_attrs %{amt: nil, pur_price: nil, ticker: nil}

  def fixture(:stock) do
    {:ok, stock} = Market.create_stock(@create_attrs)
    stock
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stocks", %{conn: conn} do
      conn = get conn, stock_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stock" do
    test "renders stock when data is valid", %{conn: conn} do
      conn = post conn, stock_path(conn, :create), stock: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, stock_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amt" => 42,
        "pur_price" => "120.5",
        "ticker" => "some ticker"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, stock_path(conn, :create), stock: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stock" do
    setup [:create_stock]

    test "renders stock when data is valid", %{conn: conn, stock: %Stock{id: id} = stock} do
      conn = put conn, stock_path(conn, :update, stock), stock: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, stock_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amt" => 43,
        "pur_price" => "456.7",
        "ticker" => "some updated ticker"}
    end

    test "renders errors when data is invalid", %{conn: conn, stock: stock} do
      conn = put conn, stock_path(conn, :update, stock), stock: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stock" do
    setup [:create_stock]

    test "deletes chosen stock", %{conn: conn, stock: stock} do
      conn = delete conn, stock_path(conn, :delete, stock)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, stock_path(conn, :show, stock)
      end
    end
  end

  defp create_stock(_) do
    stock = fixture(:stock)
    {:ok, stock: stock}
  end
end
