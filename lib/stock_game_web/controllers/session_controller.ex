
defmodule StockGameWeb.SessionController do
  use StockGameWeb, :controller

  alias StockGameWeb.Accounts
  def get_and_auth_user(username, password) do
    user = Accounts.get_user_by_username(username)
    case Comeonin.Argon2.check_pass(user, password) do
      {:ok, user} -> user
      _else       -> nil
    end
  end

  def login(conn, %{"username" => username, "password" => password}) do
    user = get_and_auth_user(username, password)

    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Logged in as #{user.username}")
    else
      conn
      |> put_session(:user_id, nil)
      |> put_flash(:error, "Bad username/password")
    end
  end

  def logout(conn, _args) do
    conn
    |> put_session(:user_id, nil)
    |> put_flash(:info, "Logged out.")
  end
end
