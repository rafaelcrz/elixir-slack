# ElixirSlack

A Elixir Slack wrapper api.

**TODO: Add description**
- Auth
	- [x] Verify if the token is valid, checks authentication and get identity info.
	- [ ] Revokes a token.
- Bots
	-  [ ] Bot information
- Channels
	- [ ] ...


## Installation

First, add ElixirSlack to your mix.exs dependencies:
```elixir
def deps do
  [
    {:elixir_slack, git: "https://github.com/rafaelcrz/elixir-slack.git"}
  ]
end
```
and run ``` $ mix deps.get ```. Add :elixir_slack to your applications list if your Elixir version is 1.3 or lower:
```elixir
def application do
  [applications: [:elixir_slack]]
end
```
## Usage

#### Auth
Check if a token is valid and return the information about it.

```elixir
iex> ElixirSlack.Api.Auth.verify("valid_token")
{:ok, content}

iex> ElixirSlack.Api.Auth.verify("invalid_token")
{:error, reason}
```

