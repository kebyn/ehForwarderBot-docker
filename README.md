# ehForwarderBot-docker
## ehForwarderBot docker image from alpine
[![Github All Releases](https://img.shields.io/github/downloads/atom/atom/total.svg)](https://github.com/kebyn/ehForwarderBot-docker)[![GitHub tag](https://img.shields.io/github/tag/expressjs/express.svg)](https://github.com/kebyn/ehForwarderBot-docker)
1. [enable channel](https://ehforwarderbot.readthedocs.io/en/latest/getting-started/)
```
wget -o config.py https://raw.githubusercontent.com/blueset/ehForwarderBot/master/config.sample.py
```
2. getting-started
```
docker run -d --restart --volume tgdata.db:/opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db --volume config.py:/opt/ehForwarderBot/config.py
```
