#!/bin/bash
# script para crear runners

GITLAB_URL="http://gitlab.cultura.lab"
TOKEN=GR1348941bnMcZ1cux8ZSsfT4ssts
DOCKER_IMAGE="alpine:latest"
TAGS="cultura,test"

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
