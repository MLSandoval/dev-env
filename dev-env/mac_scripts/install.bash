command -v > /dev/null 2>&1 || {
  echo -e "\nDocker command not found."
  echo -e "Be sure to install Docker before trying again."
  echo -e "Aborting command..."
  exit 1
}

set -e

dev_env_path="$HOME/dev-env"
local_bin_path="$HOME/.local/bin"
bash_profile_path="$HOME/.bash_profile"

touch $bash_profile_path
mkdir -p $local_bin_path
mkdir -p $dev_env_path

if [ $(grep -c 'export PATH="\$PATH:\$HOME/.local/bin"' $bash_profile_path) -eq "0" ]; then
  echo -e '\nexport PATH="$PATH:$HOME/.local/bin"' >> $bash_profile_path
fi

desktop_path="$HOME/Desktop"
dev_env_desk_path="$desktop_path/dev-env"

cp -R $dev_env_desk_path/dev-env $dev_env_path

compose_file_path="$dev_env_path/dev-env/docker/docker-compose.yml"

cat $(dirname $BASH_SOURCE)/dev-env.bash > $local_bin_path/dev-env
cat $(dirname $BASH_SOURCE)/dev-env-stop.bash > $local_bin_path/dev-env-stop
cat $(dirname $BASH_SOURCE)/dev-env-wipe.bash > $local_bin_path/dev-env-wipe
cat $(dirname $BASH_SOURCE)/dev-env-uninstall.bash > $local_bin_path/dev-env-uninstall
chmod +x $local_bin_path/dev-env*

cat <<EOF > $HOME/dev-env/dev-env/docker/docker-compose.yml

version: '3.7'

services:
  dev:
    environment:
      - DEBIAN_FRONTEND=noninteractive
    build:
      context: ../
      dockerfile: docker/Dockerfile
    container_name: dev_env
    stdin_open: true
    tty: true
    hostname: localhost
    ports:
      - 3000:3000
      - 3001:3001
      - 3002:3002
      - 3003:3003
      - 6379:6379
      - 8000:8000
      - 8081:8081
    volumes:
      - dev_home:/home/dev/
      - dev_pg:/var/lib/postgresql/12/main/
      - $HOME/Desktop:/home/dev/Desktop
      - $HOME/dev-env:/home/dev/dev-env
    command: ["tail", "-f", "/dev/null"]

volumes:
  dev_pg:
  dev_home:

EOF

sleep 1

echo -e "\n\n\nInitializing Development environment. Standby...\n\n\n"

set +e

sleep 2

docker-compose -f $compose_file_path build 2>&1 | tee $desktop_path/dev-env-install.log

if [ ${PIPESTATUS[0]} -eq 0 ]; then
  echo -e '\nDevelopment environment setup successful.'
  exit 0
fi

echo -e "\nDevelopment environment setup failed.\n"
exit 1
