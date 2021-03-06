#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install wget

curl -fsSLO https://raw.githubusercontent.com/kpango/dotfiles/master/macos/Brewfile
brew bundle --file Brewfile
rm -rf Brewfile
brew autoupdate --start --upgrade --cleanup

sudo rm -rf $HOME/.docker
sudo mkdir -p $HOME/.docker
cat <<EOF >$HOME/.docker/config.json
{
   "auths":{ },
   "credsStore":"desktop",
   "credSstore":"osxkeychain",
   "experimental": "enabled",
   "stackOrchestrator":"swarm"
}
EOF
cat <<EOF >$HOME/.docker/daemon.json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "debug":false,
  "log-opts":{
    "max-file":"3",
    "max-size":"10m"
  },
  "live-restore":true,
  "log-driver":"json-file",
  "experimental":true,

  "features": {
    "buildkit": true
  },

  "dns": [
    "1.1.1.1",
    "8.8.8.8"
  ],
  "dns-opts":[
    "timeout:1"
  ],
  "registry-mirrors": [
    "https://mirror.gcr.io"
  ]
}
EOF

curl -fsSLO https://raw.githubusercontent.com/kpango/dotfiles/master/macos/monokai.terminal
open monokai.terminal
rm -rf monokai.terminal

mas install 1475387142

curl -fsSLO https://raw.githubusercontent.com/kpango/dotfiles/master/macos/localhost.homebrew-autoupdate.plist
cp ./localhost.homebrew-autoupdate.plist $HOME/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
plutil -lint $HOME/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
launchctl load $HOME/Library/LaunchAgents/localhost.homebrew-autoupdate.plist

echo "please input Cisco AnyConnect VPN password"
security add-generic-password -a $(whoami) -s mac_login_pass -w