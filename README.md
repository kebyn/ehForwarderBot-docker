# [ehForwarderBot-docker](https://github.com/blueset/ehForwarderBot)

### ehForwarderBot docker image from alpine
![Docker Pulls](https://img.shields.io/docker/pulls/kebyn/ehforwarderbot-docker)  [![GitHub tag](https://img.shields.io/github/tag/kebyn/ehForwarderBot-docker.svg)](https://github.com/kebyn/ehForwarderBot-docker)
## v2 version
1. `blueset.telegram/config.yaml`
  ```
  ##################
  # Required items #
  ##################
  # You are required to fill the option below,
  # or this channel will not work.

  # Telegram bot token.
  # This is the token you obtained from BotFather
  token: "12345678:1a2b3c4d5e6g7h8i9j"

  # List of Telegram User IDs of admins
  # ETM will only process messages and commands from users
  # listed below. This ID can be obtained from various ways
  # on Telegram.
  admins:
  - 102938475
  - 91827364

  # Experimental Flags
  # This section can be used to enable experimental functionality.
  # However, those features may be changed or removed at any time.
  # Options in this section is explained afterward.
  flags:
    option_one: 10
    option_two: false
    option_three: "foobar"
  ```
  - edit config.yaml
2. getting-started
    ```
    docker run -d --restart --volume $(pwd)/blueset.telegram:/root/.ehforwarderbot/profiles/default/blueset.telegram/ kebyn/ehForwarderBot-docker
    ```
## V1 version
1. config
  ```
  wget -o config.py https://raw.githubusercontent.com/blueset/ehForwarderBot/v1/config.sample.py
  ```
  - edit config.py
2. getting-started
  ```
  docker run -d --restart --volume $(pwd)/tgdata.db:/opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db --volume $(pwd)/config.py:/opt/ehForwarderBot/config.py kebyn/ehForwarderBot-docker:release-1.0
  ```
