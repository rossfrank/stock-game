# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StockGame.Repo.insert!(%StockGame.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

StockGame.Repo.delete_all(StockGame.Accounts.User)
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "test",  stocks: String.split("AAPL FB")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "user",  stocks: String.split("NVDA GOOG")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "ross",  stocks: String.split("AAPL INTC")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "matt",  stocks: String.split("AAPL MSFT")})
