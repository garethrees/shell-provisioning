# Install rbenv and ruby-build plugin
install_rbenv() {
  if [ ! -d /usr/local/rbenv ]
    then
      git clone https://github.com/sstephenson/rbenv /usr/local/rbenv
      git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
    else
      echo 'rbenv already installed'
  fi

  if [ ! -f /etc/profile.d/rbenv.sh ]
    then
      # Add rbenv paths to all profiles
      cat > /etc/profile.d/rbenv.sh <<END
export RBENV_ROOT=/usr/local/rbenv
export PATH=\$RBENV_ROOT/bin:$PATH
eval "\$(rbenv init -)"
END
    else
      echo '/etc/profile.d/rbenv.sh already exists'
  fi

  source ~/.bash_profile
}

install_ruby() {

  if [ ! `which rbenv` ]
    then
      echo 'Cant locate rbenv'
      exit 1
  fi

  if [ ! -f /usr/local/rbenv/shims/ruby ]
    then
      # Install Ruby dependencies
      yum -y -q install gcc zlib-devel openssl-devel
  
      # Install Ruby 2.1.0 and set as default Ruby
      rbenv install 2.1.0
      rbenv global 2.1.0

      source ~/.bash_profile

      # Install Ruby development headers so that gems with native dependencies
      # will install correctly
      yum -y -q install ruby-devel

      # Install bundler and rehash for rbenv to pick up new executable
      gem install bundler foreman --no-ri --no-rdoc
      rbenv rehash
    else
      echo 'Ruby 2.1.0 already installed :)'
  fi
}

install_rbenv
install_ruby
source ~/.bash_profile
rbenv rehash