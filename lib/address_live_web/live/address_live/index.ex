defmodule AddressLiveWeb.AddressLive.Index do
  use AddressLiveWeb, :live_view

  alias AddressLive.Error
  alias AddressLive.ViaCep.Client

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :address, %AddressLive.ViaCep.Address{})}
  end

  @impl true
  def handle_event("set-address", %{"key" => "Tab", "value" => cep}, socket) do
    case Client.get_cep_info(cep) do
      {:ok, address} -> {:noreply, assign(socket, :address, address)}
      {:error, %Error{} = error} -> {:noreply, put_flash(socket, :error, error.result)}
    end
  end

  @impl true
  def handle_event("set-address", _key, socket) do
    {:noreply, assign(socket, :address, %AddressLive.ViaCep.Address{})}
  end
end
