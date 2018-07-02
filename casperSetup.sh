#!/bin/bash
#This script assumes that firefox is not installed or has been uninstalled.

wget https://ftp.mozilla.org/pub/firefox/releases/59.0.2/linux-x86_64/en-US/firefox-59.0.2.tar.bz2
tar -xvf firefox-59.0.2.tar.bz2
sudo rm –r /usr/lib/*firefox*
sudo rm /usr/bin/*firefox*
sudo mv firefox /usr/lib/
sudo ln –sf /usr/lib/firefox/firefox /usr/bin/firefox
sudo rm –r /usr/lib/firefox/*update*
export SLIMERJSLAUNCHER="/usr/bin/firefox:$PATH"

sudo apt update -y
sudo apt install -y libstdc++6 libfontconfig libfontconfig1-dev libfreetype6 git python phantomjs libc6 libstdc++6 libgcc1 libgtk2.0-0 libasound2 libxrender1 libdbus-glib-1-2 wget
wget https://download.slimerjs.org/releases/1.0.0/slimerjs-1.0.0.tar.bz2
tar xjvf slimerjs-1.0.0.tar.bz2
cd slimerjs-1.0.0
sudo ln -sf `pwd`/slimerjs /usr/local/bin/slimerjs
sudo sed -i "/MaxVersion=/c\MaxVersion=59.*" application.ini
git clone git://github.com/casperjs/casperjs.git
sudo ln -sf `pwd`/casperjs/bin/casperjs /usr/local/bin/casperjs

#sudo shutdown -r now
