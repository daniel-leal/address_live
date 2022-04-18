defmodule AddressLive.RegisterTest do
  use AddressLive.DataCase

  alias AddressLive.Register

  describe "addresses" do
    alias AddressLive.Register.Address

    import AddressLive.RegisterFixtures

    @invalid_attrs %{complement: nil, ddd: nil, district: nil, ibge: nil, location: nil, state: nil, zip: nil}

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert Register.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Register.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      valid_attrs = %{complement: "some complement", ddd: "some ddd", district: "some district", ibge: "some ibge", location: "some location", state: "some state", zip: "some zip"}

      assert {:ok, %Address{} = address} = Register.create_address(valid_attrs)
      assert address.complement == "some complement"
      assert address.ddd == "some ddd"
      assert address.district == "some district"
      assert address.ibge == "some ibge"
      assert address.location == "some location"
      assert address.state == "some state"
      assert address.zip == "some zip"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Register.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      update_attrs = %{complement: "some updated complement", ddd: "some updated ddd", district: "some updated district", ibge: "some updated ibge", location: "some updated location", state: "some updated state", zip: "some updated zip"}

      assert {:ok, %Address{} = address} = Register.update_address(address, update_attrs)
      assert address.complement == "some updated complement"
      assert address.ddd == "some updated ddd"
      assert address.district == "some updated district"
      assert address.ibge == "some updated ibge"
      assert address.location == "some updated location"
      assert address.state == "some updated state"
      assert address.zip == "some updated zip"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Register.update_address(address, @invalid_attrs)
      assert address == Register.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Register.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Register.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Register.change_address(address)
    end
  end
end
