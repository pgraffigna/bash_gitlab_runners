#!/bin/bash
# script para crear runners

GITLAB_URL="http://gitlab.home.local"
TOKEN=wixm9sdqVX_1KdbmZ9CJ
DOCKER_IMAGE="alpine:latest"
TAGS="docker"

gitlab-runner register --non-interactive \
  --url ${GITLAB_URL} \
  --registration-token ${TOKEN} \
  --executor docker \
  --docker-image ${DOCKER_IMAGE} \
  --name runner-$(echo $RANDOM | md5sum | head -c 10) \
  --docker-pull-policy always \
  --locked=false \
  --run-untagged=false \
  --docker-privileged=false \
  --tag-list ${TAGS}

gitlab-runner verify
