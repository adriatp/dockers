#!/bin/bash

case "$1" in
  up)
    operation="up -d"
    ;;
  down)
    operation="down"
    ;;
  kill-all)
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    docker rmi -f $(docker images -a -q)
    docker volume rm -f $(docker volume ls -q)
    exit 0
    ;;
  *)
    echo "Invalid operation."
    exit 1
    ;;
esac

case "$2" in
  mongo)
    service="-f ./mongo/docker-compose.yml"
    dotenv="--env-file ./credentials/mongo.env"
    ;;
  mongo-express)
    service="-f ./mongo-express/docker-compose.yml"
    dotenv="--env-file ./credentials/mongo.env --env-file ./credentials/mongo-express.env"
    ;;
  *)
    echo "Invalid service."
    exit 1
    ;;
esac

cmd="docker compose $service $dotenv $operation"

eval $cmd