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
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "user",  stocks: String.split("NVDA GOOG TCI")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "ross",  stocks: String.split("AAPL INTC MU")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "matt",  stocks: String.split("AAPL MSFT KL")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "steve",  stocks: String.split("TWTR SQ OLED")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "joe",  stocks: String.split("YY TREE OPNT")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "tom",  stocks: String.split("COOL FANH AAPL")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "julie",  stocks: String.split("KEM RIOT CBAY")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "anne",  stocks: String.split("VRS AAAP MU")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "andrew",  stocks: String.split("AAPL TROX KRO URGN RICK")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "chris",  stocks: String.split("AAPL MSFT SHOP CODA USAT")})
StockGame.Repo.insert!(%StockGame.Accounts.User{username: "lisa",  stocks: String.split("VSI VNCE ALT AYTU")})
