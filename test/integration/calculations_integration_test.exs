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
    response = APICall.post!("/calculations", %{})
    assert response.status_code == 201
  end
end
