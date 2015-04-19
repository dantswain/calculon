defmodule CalculationsIntegrationTest do
  use ExUnit.Case

  alias Calculon.Support.APICall

  setup_all do
    Calculon.Support.Helpers.launch_api
  end

  test "POST /api/v1/calculations returns HTTP 201" do
    response = APICall.post!("/calculations", "")
    assert response.status_code == 201
  end
end
