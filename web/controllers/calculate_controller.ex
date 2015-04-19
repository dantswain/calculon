defmodule Calculon.CalculateController do
  use Phoenix.Controller

  plug :action

  def create(conn, params) do
    conn
    |> put_status(201)
    |> json  %{ok: true}
  end
end
