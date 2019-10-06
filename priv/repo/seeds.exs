# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveViewCommerce.Repo.insert!(%LiveViewCommerce.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias LiveViewCommerce.Catalog
alias Faker.{Commerce, Lorem}

skus = Faker.Util.sample_uniq(10, fn -> Faker.String.base64(8) end)

Enum.each(skus, fn sku ->
  Catalog.create_product(%{
    sku: sku,
    name: Commerce.product_name(),
    price: Commerce.price(),
    description: Lorem.sentence(5..15)
  })
end)
