# web/controllers/calculations_controller.ex
defmodule Calculon.CalculationsController do
  use Phoenix.Controller

  def create(conn, params) do
    input = params["calculation"]["input"]
    output = Calculon.Calculator.eval(input)

    if output do
      conn
      |> put_status(201)
      |> json %{calculation: %{input: input, output: "#{output}"}}
    else
      conn
      |> put_status(400)
      |> json %{error: %{input: ["unable to parse"]}}
    end
  end
end
