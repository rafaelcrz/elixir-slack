defmodule ElixirSlack.BotTest do
  use ExUnit.Case, async: false
  alias ElixirSlack.Bot

  test "get information about a valid bot user" do
    assert {:ok, _content} = Bot.info()
  end
end
