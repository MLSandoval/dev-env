function install-postgres() {

  local pgweb_url=https://github.com/sosedoff/pgweb/releases/download/v0.11.4/pgweb_linux_amd64.zip

  cat << EOF >> /home/dev/.bashrc

export PGPASSWORD=buble
export PGUSER=dev
export PGDAATABASE=dev

alias pgweb='pgweb --bind=0.0.0.0'

EOF

  sudo -s && \
  apt-get -y -q install postgresql && \ 
  sudo service postgresql start && \
  sudo -u postgres psql -c "create user dev with superuser password 'buble'" && \
  sudo -u postgres bash -c "createdb -O dev dev" && \
  http -d get $pgweb_url -o pgweb_linux_amd64.zip && \
    unzip pgweb_linux_amd64.zip && \
    mv pgweb_linux_amd64 /usr/local/bin/pgweb && \
    rm pgweb_linux_amd64.zip && \
  service postgresql stop
}
