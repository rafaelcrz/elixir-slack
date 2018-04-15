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
        "team" => "team_name",
        "team_id" => "UA4R6AAA",
        "url" => "https://your_team_name.slack.com/",
        "user" => "mybot",
        "user_id" => "UA4R6AAA"
      }}
  """
  @spec verify() :: {atom, map}
  def verify() do
    Client.post(@slack_host<>"/auth.test", %{}, [])
    |> Client.process_response()
  end
end
