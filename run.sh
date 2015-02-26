#bin/bash

if [ $# -lt 2 ]; then
    GUEST=$1
    if [ $1 == "Ubuntu" ]; then
        BOX="chef/ubuntu-14.04"
    elif [$1 == "CentOS" ]; then
        BOX="chef/centos-6.5"
    fi
else
    BOX="chef/centos-6.5"
    GUEST="CentOS"
fi



echo "VagrantSetup/"$GUEST"_Vagrantfile"

vagrant init $BOX

mv Vagrantfile Vagrantfile.$GUEST.backup
git clone https://github.com/seiya2/VagrantSetup.git
cp "VagrantSetup/"$GUEST"/Vagrantfile" Vagrantfile
cp "VagrantSetup/"$GUEST"/config.sh" .

vagrant up
vagrant ssh

cd /vagrant/
sudo chmod +x config.sh
./config.sh
