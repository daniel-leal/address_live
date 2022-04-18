defmodule AddressLiveWeb.PageController do
  use AddressLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
