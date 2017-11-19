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

#StockGame.Repo.delete_all(User)
#StockGame.Accounts.create_user(%{username: "test"})
#StockGame.Accounts.create_user(%{username: "second"})
StockGame.Accounts.create_user(%{username: "third"})
