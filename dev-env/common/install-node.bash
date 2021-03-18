function install-node() {

  local nvm_url=https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh

  mkdir /home/dev/.nvm && \
  http -b get $nvm_url | bash && \
  source /home/dev/.nvm/nvm.sh && \
  nvm install 14.15.1

  cat << EOF > /home/dev/.config/configstore/update-notifier-npm.json
{
  "optOut": true,
  "lastUpdateCheck": 1567565734333
}
EOF

}