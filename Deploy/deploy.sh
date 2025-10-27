#!/bin/bash
set -e
TEMPLATE="/opt/microservices/docker-compose.yml.template"
DEST="/opt/microservices/docker-compose.yml"
USER_TAG="$1"

if [ -z "$USER_TAG" ]; then
  echo "Usage: $0 USER_TAG"
  exit 1
fi

export USER_TAG

envsubst < "$TEMPLATE" > "$DEST"
cd /opt/microservices
docker-compose pull
docker-compose up -d --remove-orphans
