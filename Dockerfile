# TODO
# 1. loop through folders
# 2. get download link from .info file
# 3. verify MD5 sum
# 4. test 32-bit if applicable
# 5. catch and register failures smartly
FROM vbatts/slackware:14.2

WORKDIR /slackbuilds/heroku-client
COPY heroku-client/. .
RUN slackpkg update gpg && slackpkg update && slackpkg install ruby
RUN wget https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz --no-check-certificate
RUN chmod +x heroku-client.SlackBuild && ./heroku-client.SlackBuild
RUN installpkg /tmp/heroku-client*.tgz
RUN heroku --version

CMD ["echo", "Success!"]
