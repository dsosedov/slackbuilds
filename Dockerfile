# TODO
# 1. loop through folders
# 2. get download link from .info file
# 3. verify MD5 sum
# 4. test 32-bit if applicable
# 5. catch and register failures smartly
FROM vbatts/slackware:14.2

WORKDIR /slackbuilds/cf-cli
COPY cf-cli/. .
RUN wget https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v6.50.0/cf-cli_6.50.0_linux_x86-64.tgz --no-check-certificate
RUN chmod +x cf-cli.SlackBuild && ./cf-cli.SlackBuild
RUN installpkg /tmp/cf-cli*.tgz
RUN cf version

WORKDIR /slackbuilds/heroku-client
COPY heroku-client/. .
RUN slackpkg update gpg && slackpkg update && slackpkg install ruby
RUN wget https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz --no-check-certificate
RUN chmod +x heroku-client.SlackBuild && ./heroku-client.SlackBuild
RUN installpkg /tmp/heroku-client*.tgz
RUN heroku --version

WORKDIR /slackbuilds/minikube
COPY minikube/. .
RUN wget https://github.com/kubernetes/minikube/releases/download/v1.8.2/minikube-linux-amd64 --no-check-certificate
RUN chmod +x minikube.SlackBuild && ./minikube.SlackBuild
RUN installpkg /tmp/minikube*.tgz
RUN minikube version

CMD ["echo", "Success!"]
