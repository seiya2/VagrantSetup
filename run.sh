#bin/bash

git clone https://github.com/seiya2/VagrantSetup.git

if [ $# -ge 1 ]; then
    GUEST=$1
    if [ "$GUEST" = "Ubuntu" ]; then
        BOX="chef/ubuntu-14.04"
    elif [ "$GUEST" = "CentOS" ]; then
        BOX="chef/centos-6.5"
    fi
else
    BOX="chef/centos-6.5"
    GUEST="CentOS"
fi

vagrant init $BOX

mv Vagrantfile "Vagrantfile.${GUEST}.backup"
cp "VagrantSetup/${GUEST}/Vagrantfile" Vagrantfile
cp "VagrantSetup/${GUEST}/config.sh" .

vagrant up
vagrant ssh

cd /vagrant/
sudo chmod +x config.sh
./config.sh
