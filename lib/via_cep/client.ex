defmodule AddressLive.ViaCep.Client do
  use Tesla

  alias AddressLive.ViaCep.Address
  alias AddressLive.Error
  alias Tesla.Env

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws/"
  plug Tesla.Middleware.JSON

  def get_cep_info(cep) do
    "#{cep}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"erro" => true}}}) do
    {:error, Error.build(:not_found, "CEP not found!")}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, cast_to_struct(body)}
  end

  defp handle_get({:ok, %Env{status: 400}}) do
    {:error, Error.build(:bad_request, "Invalid CEP!")}
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end

  defp cast_to_struct(address) do
    attrs = for {key, val} <- address, into: %{}, do: {String.to_atom(key), val}
    Map.merge(%Address{}, attrs)
  end
end
