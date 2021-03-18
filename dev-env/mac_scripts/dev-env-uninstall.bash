#!/bin/bash

buble_path="$HOME/dev-env"

compose_file_path="$buble_path/dev-env/docker/docker-compose.yml"

docker-compose -f $compose_file_path down -v --rmi all

rm -rf $buble_path

local_bin_path="$HOME/.local/bin"

rm $local_bin_path/dev-env*

echo -e "\nbuble-dev has been uninstalled."
echo -e "You may now remove docker from your applications if you wish."
