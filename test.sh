#!/bin/sh
docker build -t dsosedov/slackbuilds:latest .
docker run -it --rm dsosedov/slackbuilds:latest
docker rmi dsosedov/slackbuilds
