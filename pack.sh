#!/bin/sh
mkdir -p packages
tar cvzf packages/cf-cli.tar.gz cf-cli/
tar cvzf packages/fly.tar.gz fly/
tar cvzf packages/heroku-client.tar.gz heroku-client/
tar cvzf packages/minikube.tar.gz minikube/
