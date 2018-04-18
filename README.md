# ElixirSlack

[![Build Status](https://semaphoreci.com/api/v1/rafaelcrz/elixir-slack/branches/master/badge.svg)](https://semaphoreci.com/rafaelcrz/elixir-slack)

A Elixir Slack wrapper api.

**TODO: Add description**
- Auth
	- [x] Verify if the token is valid, checks authentication and get identity info.
- Bots
	-  [x] Bot information
- Channels
	- [x] Get info
	- [x] Get all channels on Slack team


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

## Setup
Add the environment var BOT_USER_TOKEN or add the following configuration on your application 

```elixir 
config :elixir_slack, bot_user_token: "YOUR BOT USER TOKEN"
```

## Usage

#### Auth
Check if a token is valid and return the information about it.

```elixir
iex> ElixirSlack.Auth.verify()
{:ok,
 %{
   "team" => "your team name",
   "team_id" => "your team id",
   "url" => "https://your_team_name.slack.com/",
   "user" => "your_bot_name",
   "user_id" => "your_user_id"
 }}
```
#### Bot
Get user bot information
```elixir
iex> ElixirSlack.Bot.info("your_bot_id")

{:ok,
%{
  "bot" => %{
    "app_id" => "app_id",
    "deleted" => false,
    "icons" => %{
      "image_36" => "url_image",
      "image_48" => "url_image",
      "image_72" => "url_image"
    },
    "id" => "id",
    "name" => "bot",
    "updated" => timestamp
  }
}}
```

