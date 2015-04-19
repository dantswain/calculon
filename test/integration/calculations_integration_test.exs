# test/integration/calculations_integration_test.exs
defmodule CalculationsIntegrationTest do
  use ExUnit.Case

  # alias for convenience
  alias Calculon.Support.APICall

  # use the setup_all hook to make sure the API is
  # serving content during tests
  setup_all do
    Calculon.Support.Helpers.launch_api
  end

  test "POST /api/v1/calculations returns HTTP 201" do
    response = APICall.post!("/calculations", %{calculation: %{input: "1 + 1"}})
    assert response.status_code == 201
  end

  test "simple addition" do
    request = %{calculation: %{input: "1 + 1"}}
    response = APICall.post!("/calculations", request)

    expected_response = %{calculation: %{input: "1 + 1", output: "2"}}
    
    assert response.status_code == 201
    assert response.body == expected_response
  end

  test "invalid input returns HTTP 400" do
    response = APICall.post!("/calculations", %{calculation: %{input: ""}})
    assert response.status_code == 400
  end
end
