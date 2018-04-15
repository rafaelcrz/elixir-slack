defmodule ElixirSlack.Auth do
  alias ElixirSlack.Client

  @moduledoc """
  Authentication module.
  """

  @slack_host Application.get_env(:elixir_slack, :slack_host)

  @doc """
  Checks authentication & identity.
  This method checks authentication and tells "you" who you are, even if you might be a bot.
  You can also use this method to test whether Slack API authentication is functional.

  ## Examples

    iex> ElixirSlack.Auth.verify()
      {:ok, %{
        "team" => "your team name",
        "team_id" => "your team id",
        "url" => "https://your_team_name.slack.com/",
        "user" => "your_bot_name",
        "user_id" => "your_user_id"
      }}
  """
  @spec verify() :: {atom, binary}
  def verify() do
    Client.post(@slack_host<>"/auth.test", %{}, [])
    |> Client.process_response()
  end
end
