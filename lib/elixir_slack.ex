defmodule ElixirSlack do
  use Application

  def start(_, _) do
    if is_nil(System.get_env("BOT_USER_TOKEN") || Application.get_env(:elixir_slack, :bot_user_token)) do
      raise """
      Not configured error: ElixirSlack is not configured. Please add the environment var BOT_USER_TOKEN
      or add the following configuration on your application:

      config :elixir_slack, bot_user_token: "YOUR BOT USER TOKEN"

      """
    end

    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
