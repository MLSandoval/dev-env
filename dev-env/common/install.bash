__dirname=$(dirname $BASH_SOURCE)
source $__dirname/install-git.bash
source $__dirname/install-network-tools.bash
source $__dirname/install-node.bash
source $__dirname/install-postgres.bash
source $__dirname/install-redis.bash

function announce() {
  echo -e "\n\n\nSetting up $1...\n\n\n"
  sleep 2
}

function bail() {
  echo -e "\n\n\nFailed to setup $1... exiting.\n\n\n" 1>&2
  exit 1
}

apt-get -y install \
  nano \
  psmisc \
  bash-completion \
  build-essential

mkdir -p /home/dev/.local

announce "network tools" && install-network-tools || bail "network tools"

announce "Git" && install-git || bail "Git"

announce "PostgreSQL" && install-postgres || bail "PostgreSQL"

announce "Node.js" && install-node || bail "Node.js"

announce "Redis" && install-redis || bail "Redis"

chown -R dev:dev /home/dev

apt-get autoremove
