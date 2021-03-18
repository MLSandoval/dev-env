function install-redis() {
  
  cat << EOF >> /home/dev/.bashrc
export REDIS_PW=buble
export REDIS_USER=dev
EOF

  sudo -s && \
  apt-get -yq install redis-server
}
