function install-network-tools() {
  
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y -o Dpkg::Options::="--force-confdef" \
               -o Dpkg::Options::="--force-confold" \
    install \
      unzip \
      curl \
      host \
      httpie \

  mkdir -p /home/dev/.httpie && \
  chown -R dev:dev /home/dev/.httpie && \

  cat << EOF > /home/dev/.httpie/config.json

{
  "__meta__": {
    "about": "HTTPie config file",
    "help": "https://httpie.prg/doc#config",
    "httpie": "0.9.8"
  },
  "default_options": [
    "--session=default"
  ]
}

EOF
}