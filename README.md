# A Docker container of a GitHub self-hosted runner

Based on this [post](https://baccini-al.medium.com/how-to-containerize-a-github-actions-self-hosted-runner-5994cc08b9fb)

## What is this?

A self-hosted runner is a system that allows users to run jobs from GitHub Actions.

## Why?

It's more easy to upgrade, maintain and extend the runners, and cheaper :P

## How to run?

Open the .env file and replace with your information:

REPO="youruser/yourRepo"
ACCESS_TOKEN="yourRunnerToken"

now run:

```bash
docker compose up -d
```

enjoy!

## How to upgrade?

Edit the `Dockerfile` and change the line: ARG RUNNER_VERSION="2.321.0"

now run:

docker compose up -d

## What's the latest version?

You can find the latest version [here](https://github.com/actions/runner/releases)
