defmodule ElixirSlack.Request.Client do
  use HTTPoison.Base

  defp header, do: [{"Content-Type", "application/json; charset=utf-8"}]

  def process_url(url) do
    url
  end

  defp process_request_body(body) do
    Poison.encode!(body)
  end

  defp process_request_headers(headers) do
    Enum.into(header(), headers)
  end

  def process_request_options(options) do
    options ++ [hackney: [pool: __MODULE__]]
  end

  defp process_response_body(body) do
    Poison.decode!(body)
  end

  def process_status_code(status) do
    status
  end

  def process_response({:ok, %{body: body, headers: _headers, request_url: _url, status_code: _status}}) do
    case body do
      %{"error" => reason, "ok" => _ok} -> {:error, reason}
      _ -> {:ok, body}
    end
  end
end
