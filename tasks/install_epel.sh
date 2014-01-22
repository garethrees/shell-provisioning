install_epel() {
  if [ ! -f /etc/yum.repos.d/epel.repo ]
    then
      rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
      yum clean all
    else
      echo 'EPEL repository already installed'
  fi
}

install_epel
