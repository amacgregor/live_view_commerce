defmodule LiveViewCommerce.CatalogTest do
  use LiveViewCommerce.DataCase

  alias LiveViewCommerce.Catalog

  describe "products" do
    alias LiveViewCommerce.Catalog.Product

    @valid_attrs %{created_at: ~N[2010-04-17 14:00:00], description: "some description", name: "some name", price: 120.5, sku: "some sku", updated_at: ~N[2010-04-17 14:00:00]}
    @update_attrs %{created_at: ~N[2011-05-18 15:01:01], description: "some updated description", name: "some updated name", price: 456.7, sku: "some updated sku", updated_at: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{created_at: nil, description: nil, name: nil, price: nil, sku: nil, updated_at: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Catalog.create_product(@valid_attrs)
      assert product.created_at == ~N[2010-04-17 14:00:00]
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.price == 120.5
      assert product.sku == "some sku"
      assert product.updated_at == ~N[2010-04-17 14:00:00]
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Catalog.update_product(product, @update_attrs)
      assert product.created_at == ~N[2011-05-18 15:01:01]
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.price == 456.7
      assert product.sku == "some updated sku"
      assert product.updated_at == ~N[2011-05-18 15:01:01]
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)
      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end
end
