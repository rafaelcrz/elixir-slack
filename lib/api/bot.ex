defmodule ElixirSlack.Bot do
  alias ElixirSlack.Client

  @moduledoc """
  Bot functions.
  """

  @slack_host Application.get_env(:elixir_slack, :slack_host)

  @doc """
  Gets information about a bot user.

    ## Examples

    iex> ElixirSlack.Bot.info(bot_id)
      {:ok,
      %{
        "bot" => %{
          "app_id" => "UA4R6AAA",
          "deleted" => false,
          "icons" => %{
            "image_36" => "url_image",
            "image_48" => "url_image",
            "image_72" => "url_image"
          },
          "id" => "BA4KZJDJ",
          "name" => "bot",
          "updated" => 1523413158
        }
      }}

    iex> ElixirSlack.Bot.info()
      {:ok,
      %{
        "ok" => true
      }}
  """
  @spec info(bot_id :: binary) :: {atom, map}
  def info(bot_id \\ "") do
    Client.get(@slack_host<>"/bots.info", [], params: %{bot: bot_id})
    |> Client.process_response()
  end

end
