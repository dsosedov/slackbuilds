#!/bin/sh
if [ -z $1 ]
then
    echo "Missing package"
else
    docker build -t dsosedov/slackbuilds-$1:latest -f Dockerfile-$1 .
    docker run -it --rm dsosedov/slackbuilds-$1:latest
    docker rmi dsosedov/slackbuilds-$1
fi
