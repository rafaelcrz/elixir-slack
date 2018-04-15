defmodule ElixirSlack.Channel do
  alias ElixirSlack.Client
  @moduledoc """
  Channels functions.
  """

  @slack_host Application.get_env(:elixir_slack, :slack_host)

  @doc """
  Gets information about a channel.

    ## Examples

    iex> ElixirSlack.Channel.info()
      {:ok,
      %{
        "channel" => %{
          "created" => 1523330538,
          "creator" => "UA4R6AAA",
          "id" => "CA3UHUAAA",
          "is_archived" => false,
          "is_channel" => true,
          "is_general" => true,
          "is_member" => false,
          "is_mpim" => false,
          "is_org_shared" => false,
          "is_private" => false,
          "is_read_only" => false,
          "is_shared" => false,
          "members" => ["UA4R6KKJ"],
          "name" => "general",
          "name_normalized" => "general",
          "previous_names" => [],
          "purpose" => %{
            "creator" => "UA4KH4ECE",
            "last_set" => 1523330538,
            "value" => "This channel is for workspace-wide communication and announcements. All members are in this channel."
          },
          "topic" => %{
            "creator" => "UA4LJUECE",
            "last_set" => 1523330538,
            "value" => "Company-wide announcements and work-based matters"
          },
          "unlinked" => 0
        }
      }}
  """
  @spec info(channel_id :: binary, locale :: boolean) :: {atom, map}
  def info(channel_id, locale \\ false) do
    Client.get(@slack_host<>"/channels.info", [], params: %{channel: channel_id, locale: locale})
    |> Client.process_response()
  end

  @doc """
  Gets all channels on slack team

    ## Examples

    iex> ElixirSlack.Channel.info()
      %{
      "channels" => [
        %{
          "created" => 1523330538,
          "creator" => "UA4RAAE",
          "id" => "UA4RAAESD",
          "is_archived" => false,
          "is_channel" => true,
          "is_general" => true,
          "is_member" => false,
          "is_mpim" => false,
          "is_org_shared" => false,
          "is_private" => false,
          "is_shared" => false,
          "members" => ["UA4RAAEWF"],
          "name" => "general",
          "name_normalized" => "general",
          "num_members" => 1,
          "previous_names" => [],
          "purpose" => %{
            "creator" => "UA4RAAE",
            "last_set" => 1523330538,
            "value" => "This channel is for workspace-wide communication and announcements. All members are in this channel."
          },
          "topic" => %{
            "creator" => "UA4RAAE",
            "last_set" => 1523330538,
            "value" => "Company-wide announcements and work-based matters"
          },
          "unlinked" => 0
        }
      ]
    }
  """
  @spec list() :: {atom, map}
  def list() do
    Client.get(@slack_host<>"/channels.list",[], params: %{})
    |> Client.process_response()
  end

end
