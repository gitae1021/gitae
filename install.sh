# #!/bin/bash

# sudo apt-get update
# sudo apt-get upgrade

echo vim ssh subversion
sudo apt-get install vim ssh subversion 
sudo apt-get install exuberant-ctags

echo controller
sudo apt-get install dconf-editor gnome-tweak-tool 
sudo apt-get install compizconfig-settings-manager 
sudo apt-get install nautilus-open-terminal nautilus-actions 
sudo apt-get install libgnome2-bin

# echo teamviwer

# wget http://download.teamviewer.com/download/teamviewer_i386.deb
# sudo apt-get install -f
# sudo dpkg -i teamviewer_i386.deb

# ibus-setup
# sudo gedit /etc/default/avahi-daemon

echo sshpass chrome
# sudo apt-get install sshpass 
# sudo apt-get install chromium-browser 
sudo apt-get install tmux

echo for rocket
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
# sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev
sudo apt-get install libgmp-dev gawk build-essential bison flex texinfo gperf
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0
sudo apt-get install u-boot-tools

# sudo apt-get update
# sudo apt-get upgrade

# echo latex
# today=$(date +"%Y%m%d")
# echo "today is $today"
# sudo apt-get install texlive-latex-full
# sudo apt-get install ko.tex
# sudo apt install wget gksu perl-tk
# wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
# tar -xzf install-tl-unx.tar.gz
# cd install-tl-$today
# sudo ./install-tl
# sudo apt-get install texlive-fonts-recommended texlive-latex-recommended  texlive-science

echo open terminal
# sudo add-apt-repository universe
# sudo apt-get purge unity-webapps-common
# sudo apt-get update


# echo virtualbox
# sudo apt-get install virtualbox

echo dswp
sudo apt-get install libreadline-dev

echo gem5
sudo apt-get install scons
sudo apt-get install swig
sudo apt-get install python-dev
sudo apt-get install zlib1g-dev
sudo apt-get install mercurial
# sudo apt-get install gcc-arm-linux-gnueabihf gcc-aarch64-linux-gnu device-tree-compiler
sudo apt-get install gcc-arm-linux-gnueabi
sudo apt-get install libgoogle-perftools-dev

echo compiler
sudo apt-get install libtool
sudo apt-get install libncurses5-dev

echo mcpat
sudo apt-get install gcc-multilib g++-multilib

# echo gnuplot
# sudo apt-get install gnuplot

echo apache2
sudo apt-get install apache2
# use /var/www/html directory
# remove index.html
# copy file that want to see
# now, you can see the file through web browser (address: ip)

echo CUDA
wget http://developer.download.nvidia.com/compute/cuda/4_2/rel/toolkit/cudatoolkit_4.2.9_linux_64_ubuntu11.04.run
chmod +x cudatoolkit_4.2.9_linux_64_ubuntu11.04.run
echo please enter install path: /usr/local
sudo ./cudatoolkit_4.2.9_linux_64_ubuntu11.04.run

echo gpgpu-sim
sudo apt-get install build-essential xutils-dev bison zlib1g-dev flex bison libxmu-dev libxi-dev freeglut3 freeglut3-dev binutils-gold

echo ETC
sudo apt-get install htop
sudo apt-get install cgdb
sudo apt-get install screen

# Remainders
# vivado ID:gitae1021
# ssh key in google drive
# Hangul setting - Ref. Bookmark
