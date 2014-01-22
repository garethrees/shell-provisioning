install_dev_tools () {
  yum -y -q install git man screen tree vim
}

disable_iptables () {
  service iptables stop
}

install_dev_tools
disable_iptables
