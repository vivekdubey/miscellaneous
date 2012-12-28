#!/bin/bash
mkdir -p /opt/install
vboxmanage -v
if [ $? -eq 0 ]; then
    var=`vboxmanage -v`
    echo "Vitual box installed $var"
else
    echo "Virtual box not installed"
    cd /opt/install
    wget http://10.12.7.16/VirtualBox-4.2-4.2.6_82870_el6-1.i686.rpm
    sudo yum localinstall -y --nogpgcheck VirtualBox-4.2-4.2.6_82870_el6-1.i686.rpm
    echo "Virtual box installed now"
fi
ruby --version
    #echo "vivek $?"
if [ $? -eq 0 ]; then
    echo "Ruby already present....Skipping installation of ruby.."
else
    wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p362.tar.gz
    tar xzvf ruby-1.9.3-p362.tar.gz
    cd ruby-1.9.3-p362
    ./configure --prefix=/usr/local --enable-shared --disable-install-doc --with-opt-dir=/usr/local/lib
    make
    make install
    cd ext/openssl
    ruby extconf.rb
    make install
    cd ../readline
    ruby extconf.rb
    make install
fi

which gem
if [ $? -eq 0 ]; then
    echo "Rubygem already present...Skipping installation of rubygem"
else
    wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz
    tar xvzf rubygems-1.8.24.tgz
    cd rubygems-1.8.24
    ruby setup.rb
fi
vagrant -v
if [ $? -ne 0]; then
    gem_path=`which gem`
    gem install vagrant
    echo "Vagrant installed now"
fi

