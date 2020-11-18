#!/bin/sh
pacman -Syu
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd -
rm -r yay

curl https://raw.githubusercontent.com/kpango/dotfiles/master/arch/aur.list -o aur.list
pacman -Rs go
yay -Syu - < aur.list
HACKGEN_VERSION="$(curl --silent https://github.com/yuru7/HackGen/releases/latest | sed 's#.*tag/\(.*\)\".*#\1#' | sed 's/v//g')"
axel "https://github.com/yuru7/HackGen/releases/download/v${HACKGEN_VERSION}/HackGen_v${HACKGEN_VERSION}.zip"
unzip HackGen_v${HACKGEN_VERSION}.zip
sudo mv HackGen_v${HACKGEN_VERSION}/* /usr/share/fonts/TTF/
sudo cp /usr/bin/google-chrome-stable /usr/bin/chrome
rm -rg HackGen*
fc-cache -f -v
