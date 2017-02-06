# #!/bin/bash
echo vim ssh subversion
sudo apt-get install vim ssh subversion 
echo controller
sudo apt-get install dconf-editor gnome-tweak-tool 
sudo apt-get install compizconfig-settings-manager 
sudo apt-get install nautilus-open-terminal nautilus-actions 
echo git sshpass chrome
sudo apt-get install git sshpass
sudo apt-get install chromium-browser
echo for rocket
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev
sudo apt-get install libgmp-dev gawk build-essential bison flex texinfo gperf
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0

sudo apt-get update
sudo apt-get upgrade

echo latex
today=$(date +"%Y%m%d")
echo "today is $today"
sudo apt-get install texlive-latex-full
sudo apt-get install ko.tex
sudo apt install wget gksu perl-tk
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xzf install-tl-unx.tar.gz
cd install-tl-$today
sudo ./install-tl

echo open terminal
sudo add-apt-repository universe
sudo apt-get purge unity-webapps-common
sudo apt-get update

echo teamviwer

wget http://download.teamviewer.com/download/teamviewer_i386.deb
sudo apt-get install ./teamviewer_i386.deb

ibus-setup
sudo gedit /etc/default/avahi-daemon


# Remainders
# vivado ID:gitae1021
# ssh key in e-mail
# Hangul setting - Ref. Bookmark
