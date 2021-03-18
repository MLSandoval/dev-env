#!/bin/bash

compose_file_path="$HOME/dev-env/dev-env/docker/docker-compose.yml"

docker-compose -f $compose_file_path up -d &&
docker-compose -f $compose_file_path exec dev /bin/bash -l