defmodule ElixirSlack.Auth do
  alias ElixirSlack.Client

  @moduledoc """
  Authentication module.
  """

  @slack_host Application.get_env(:elixir_slack, :slack_host)

  defp header(auth_token) do
    [{"Authorization", "Bearer #{auth_token}"}]
  end

  @doc """
  Checks authentication & identity.
  This method checks authentication and tells "you" who you are, even if you might be a bot.
  You can also use this method to test whether Slack API authentication is functional.

  ## Examples

    iex> ElixirSlack.Api.Auth.verify("valid_token")
      {:ok, %{
        "ok" => true,
        "team" => "your team name",
        "team_id" => "your team id",
        "url" => "https://your_team_name.slack.com/",
        "user" => "your_bot_name",
        "user_id" => "your_user_id"
      }}

    iex> ElixirSlack.Api.Auth.verify("invalid_token")
      {:error, reason}

    iex> ElixirSlack.Api.Auth.verify(nil)
        {:error, "authentication token is missing"}

    iex> ElixirSlack.Api.Auth.verify("")
        {:error, "authentication token is missing"}
  """
  @spec verify(auth_token :: binary) :: {atom, binary}
  def verify(nil), do: {:error, "authentication token is missing"}
  def verify(""), do: {:error, "authentication token is missing"}

  def verify(auth_token) do
    Client.post(@slack_host<>"/auth.test", %{}, header(auth_token))
    |> Client.process_response()
  end
end
