# TODO
# 1. loop through folders
# 2. get download link from .info file
# 3. verify MD5 sum
# 4. test 32-bit if applicable
# 5. catch and register failures smartly
FROM vbatts/slackware:14.2

WORKDIR /slackbuilds/cf-cli
COPY cf-cli/. .
RUN wget https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v6.49.0/cf-cli_6.49.0_linux_x86-64.tgz --no-check-certificate
RUN chmod +x cf-cli.SlackBuild && ./cf-cli.SlackBuild
RUN installpkg /tmp/cf-cli*.tgz
RUN cf version

WORKDIR /slackbuilds/fly
COPY fly/. .
RUN wget https://github.com/concourse/concourse/releases/download/v5.8.0/fly-5.8.0-linux-amd64.tgz --no-check-certificate
RUN chmod +x fly.SlackBuild && ./fly.SlackBuild
RUN installpkg /tmp/fly*.tgz
RUN fly --version

WORKDIR /slackbuilds/heroku-client
COPY heroku-client/. .
RUN slackpkg update gpg && slackpkg update && slackpkg install ruby
RUN wget https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz --no-check-certificate
RUN chmod +x heroku-client.SlackBuild && ./heroku-client.SlackBuild
RUN installpkg /tmp/heroku-client*.tgz
RUN heroku --version

WORKDIR /slackbuilds/minikube
COPY minikube/. .
# TODO: change to versioned URL
RUN wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 --no-check-certificate
RUN chmod +x minikube.SlackBuild && ./minikube.SlackBuild
RUN installpkg /tmp/minikube*.tgz
RUN minikube version

CMD ["echo", "Success!"]
