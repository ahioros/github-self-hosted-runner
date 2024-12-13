#!/bin/bash

REPO=$REPO
ACCESS_TOKEN=$ACCESS_TOKEN

#REG_TOKEN=$(curl -X POST -H "Authorization: token ${ACCESS_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/repos/${REPO}/actions/runners/registration-token | jq .token --raw-output)

cd /home/docker/actions-runner

echo "ACCESS_TOKEN:${ACCESS_TOKEN}"
echo "REG_TOKEN:${REG_TOKEN}"
echo "REPO:${REPO}"

./config.sh --url https://github.com/${REPO} --token ${ACCESS_TOKEN}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${ACCESS_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!
