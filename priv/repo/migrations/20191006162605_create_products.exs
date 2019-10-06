defmodule LiveViewCommerce.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :sku, :string
      add :price, :float
      add :description, :text
      timestamps()
    end
  end
end
