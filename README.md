# ElixirSlack

A Elixir Slack wrapper api.

**TODO: Add description**
- Auth
	- [x] Verify if the token is valid, checks authentication and get identity info.
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
{:ok,
 %{
   "ok" => true,
   "team" => "your team name",
   "team_id" => "your team id",
   "url" => "https://your_team_name.slack.com/",
   "user" => "your_bot_name",
   "user_id" => "your_user_id"
 }}

iex> ElixirSlack.Api.Auth.verify("invalid_token")
{:error, "invalid_auth"}
```

