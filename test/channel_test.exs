defmodule ElixirSlack.ChannelTest do
  use ExUnit.Case, async: false
  alias ElixirSlack.Channel

  @tag :channel_info_error
  test "get channel information, with an invalid id" do
    assert {:error, _reason} = Channel.info("fake_id")
  end

  @tag :channel_info
  test "get channel information, with a valid id" do
    assert {:ok, _content} = Channel.info("CA3UHUZQA")
  end

  @tag :channel_list
  test "list all channels in a slack team" do
    assert {:ok, _content} = Channel.list()
  end
end
