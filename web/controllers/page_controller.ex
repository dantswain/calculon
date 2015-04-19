defmodule Calculon.PageController do
  use Calculon.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
