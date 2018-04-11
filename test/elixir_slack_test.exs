defmodule ElixirSlackTest do
  use ExUnit.Case
  doctest ElixirSlack

  test "greets the world" do
    assert ElixirSlack.hello() == :world
  end
end
