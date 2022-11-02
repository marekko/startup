#!/bin/bash

# Simple setup.sh for configuring Ubuntu 16.04 LTS EC2 instance
# for headless setup.

#update

sudo apt-get update

sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y rlwrap
sudo apt-get install -y screen
sudo apt-get install -y mc
sudo apt-get install -y vim
sudo apt-get install -y fonts-powerline
sudo apt install direnv


# install zshell
sudo apt install -y zsh
#chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install zsh-autosugestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# install docker
# based on https://docs.docker.com/engine/installation/linux/ubuntulinux/

#sudo apt-get install -y apt-transport-https ca-certificates

#sudo apt-key adv \
#               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
#               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# ubuntuu xenial 16.04

#echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | \
#                sudo tee /etc/apt/sources.list.d/docker.list



# check if it is ready: apt-cache policy docker-engine

# install dependencies
#sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

# install docker
#sudo apt-get install -y docker-engine

# start service 
#sudo service docker start


# Install emacs24
# https://www.bahudha.com/linux/install-gnu-emacs-24-ubuntu
# sudo add-apt-repository -y ppa:cassou/emacs
#sudo add-apt-repository ppa:ubuntu-elisp/ppa
#sudo apt-get -qq update
#sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg


# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

#powerline
#sudo apt-get install -y python-pip
#sudo pip install --upgrade pip
#sudo pip install git+git://github.com/Lokaltog/powerline
#install fonts
#wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
#sudo mv PowerlineSymbols.otf /usr/share/fonts/
#sudo fc-cache -vf
#sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/




git clone https://github.com/marekko/dotfiles.git
#ln -sb dotfiles/.screenrc .
#ln -sb dotfiles/.bash_profile .
#ln -sb dotfiles/.bashrc .
#ln -sb dotfiles/.bashrc_custom .
#ln -sf dotfiles/.emacs.d .
ln -sb dotfiles/.zshrc .

# teraform : https://computingforgeeks.com/how-to-install-terraform-on-ubuntu/
sudo apt install  -y software-properties-common gnupg2 curl

curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/

sudo apt-add-repository -y "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com focal main"

sudo apt update
sudo apt install -y terraform

# install aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


