defmodule Calculon.Support.APICall do
  use HTTPoison.Base

  # prepend the url with the testing server api route
  def process_url(url) do
    "http://127.0.0.1:4001/api/v1" <> url
  end

  # try to decode response bodies as JSON
  #   but reply with the raw body if there are
  #   any errors (e.g., invalid JSON)
  def process_response_body(body) do
    try do
      Poison.decode!(body)
    rescue
      _ -> body
    end
  end
end
