defmodule Calculon.Support.Helpers do
  def launch_api do
    # we need to make sure HTTPoison is running so we can make requests
    HTTPoison.start

    # set up config for serving
    endpoint_config =
      Application.get_env(:calculon, Calculon.Endpoint)
      |> Keyword.put(:server, true)
    :ok = Application.put_env(:calculon, Calculon.Endpoint, endpoint_config)

    # restart our application with serving enabled
    :ok = Application.stop(:calculon)
    :ok = Application.start(:calculon)
  end
end
