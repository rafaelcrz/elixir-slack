defmodule ElixirSlackTest do
  use ExUnit.Case, async: false
  alias ElixirSlack.Api.Auth

  # @tag :check_valid_token
  # test "when verify a valid token return a {:ok, content}" do
  #   token = "xoxp-put_a_valid_token"
  #   assert {:ok, _content} = Auth.verify(token)
  # end

  @tag :check_invalid_token
  test "when verify an invalid token return a {:error, reason}" do
    token = "xoxp-912912u92-121212-12121-12-0000"
    assert {:error, _reason} = Auth.verify(token)
  end

  @tag :check_nil_token
  test "when get a nil token value return a {:error, 'authentication token is missing'}" do
    token = nil
    assert {:error, "authentication token is missing"} == Auth.verify(token)
    token = ""
    assert {:error, "authentication token is missing"} == Auth.verify(token)
  end
end
