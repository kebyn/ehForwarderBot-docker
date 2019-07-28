# ehForwarderBot-docker
## V1 version
### ehForwarderBot docker image from alpine
![Docker Pulls](https://img.shields.io/docker/pulls/kebyn/ehforwarderbot-docker)  [![GitHub tag](https://img.shields.io/github/tag/kebyn/ehForwarderBot-docker.svg)](https://github.com/kebyn/ehForwarderBot-docker)
```
wget -o config.py https://raw.githubusercontent.com/blueset/ehForwarderBot/v1/config.sample.py
```
2. getting-started
```
docker run -d --restart --volume tgdata.db:/opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db --volume config.py:/opt/ehForwarderBot/config.py kebyn/ehForwarderBot-docker
```
