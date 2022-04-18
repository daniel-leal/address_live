defmodule AddressLive.RegisterFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AddressLive.Register` context.
  """

  @doc """
  Generate a address.
  """
  def address_fixture(attrs \\ %{}) do
    {:ok, address} =
      attrs
      |> Enum.into(%{
        complement: "some complement",
        ddd: "some ddd",
        district: "some district",
        ibge: "some ibge",
        location: "some location",
        state: "some state",
        zip: "some zip"
      })
      |> AddressLive.Register.create_address()

    address
  end
end
