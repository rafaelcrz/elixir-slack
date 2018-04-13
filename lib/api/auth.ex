defmodule ElixirSlack.Api.Auth do
  alias ElixirSlack.Request.Client
  @moduledoc """
  Authentication module.
  """

  defp header(auth_token) do
    [{"Authorization", "Bearer #{auth_token}"}]
  end

  @doc """
  Checks authentication & identity.
  This method checks authentication and tells "you" who you are, even if you might be a bot.
  You can also use this method to test whether Slack API authentication is functional.

  ## Examples
      iex> ElixirSlack.Api.Auth.verify("valid_token")
      {:ok, content}

      iex> ElixirSlack.Api.Auth.verify("invalid_token")
      {:error, reason}

  """
  @spec verify(auth_token :: binary) :: {atom, binary}
  def verify(nil), do: {:error, "authentication token is missing"}
  def verify(""), do: {:error, "authentication token is missing"}
  def verify(auth_token) when is_binary(auth_token) do
      Client.post("https://slack.com/api/auth.test", %{}, header(auth_token))
      |> Client.process_response
  end
end
