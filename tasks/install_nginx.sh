install_nginx() {
  yum -y -q install nginx
  rm /etc/nginx/conf.d/default.conf >/dev/null 2>&1 || true
}

install_nginx
