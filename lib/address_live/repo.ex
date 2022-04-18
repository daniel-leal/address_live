defmodule AddressLive.Repo do
  use Ecto.Repo,
    otp_app: :address_live,
    adapter: Ecto.Adapters.Postgres
end
