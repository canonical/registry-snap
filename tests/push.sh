#!/bin/sh

set +e

if [ -z "$1" ]; then
    echo "Usage: $0 <registry-host>"
    exit 1
fi

REGISTRY="$1"
TIMEOUT=5
while [ $TIMEOUT -gt 0 ]; do
    STATUS=$(curl -s -o /dev/null -w '%{http_code}' "http://${REGISTRY}:5000/v2/")
    echo $STATUS
    if [ $STATUS -eq 200 ] || [ $STATUS -eq 401 ]; then
        break
    fi
    TIMEOUT=$(($TIMEOUT - 1))
    sleep 5
done

if [ $TIMEOUT -eq 0 ]; then
    echo "Registry cannot be available within one minute."
    exit 1
fi

set -e

docker pull hello-world:latest
docker tag hello-world:latest "${REGISTRY}:5000/distribution/hello-world:latest"
docker push "${REGISTRY}:5000/distribution/hello-world:latest"
docker pull "${REGISTRY}:5000/distribution/hello-world:latest"
