#!/bin/bash
# BDhunter - Created By Mehedi Shakeel
# Version 1.0

banner() {
  echo "######################################################################"
  echo "#                   BD Hunter - V1.0                                 #"
  echo "#               Created By Mehedi Shakeel                            #"
  echo "#               youtube.com/mehedishakeel                            #"
  echo "######################################################################"
  echo
}

help() {
  echo "Usage: $0 [OPTION]"
  echo "Prepares a Ubuntu Linux machine for Bug Bounty Hunting."
  echo
  echo "  -i, --install   install tools and packages"
  echo "  -h, --help      display this help menu"
  echo
}

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root."
  exit 1
fi

install() {
  # update package manager and upgrade packages
  apt-get update && apt-get upgrade -y

  # install Wget
  apt install -y wget

  # install Curl
  apt install -y curl

  # install Go language
  apt install -y golang

  # install Python language
  apt install -y python3
  
  # install Ruby language
  apt install -y ruby-full

  # install Aircrack-ng suite
  apt install -y aircrack-ng

  # install Wifite
  apt install -y wifite

  # install Nmap
  apt install -y nmap

  # install WPScan
  gem install wpscan

  # install Sqlmap
  apt install -y sqlmap 
  
  # install Dirb
  apt install -y dirb

  # install Dirsearch
  apt install -y dirsearch

  # install Sqlmap
  apt install -y sqlmap

  #install Findomain
  curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip
  unzip findomain-linux-i386.zip
  chmod +x findomain
  sudo mv findomain /usr/bin/findomain

  # install Go tools & set environment variables
  sudo echo "export GOPATH=$HOME/go" >> ~/.bashrc
  sudo echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.bashrc
  sudo source ~/.bashrc
  cd
  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
  go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
  go install -v github.com/OWASP/Amass/v3/...@master
  go install github.com/ffuf/ffuf@latest
  go install github.com/lc/gau/v2/cmd/gau@latest
  go install github.com/hahwul/dalfox/v2@latest
  go install github.com/tomnomnom/waybackurls@latest
  go install -v github.com/lukasikic/subzy@latest
 
  # install Seclists wordlists
  git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists
  chmod -R 755 /opt/SecLists
  chown -R $USER:$USER /opt/SecLists

}

case "$1" in
  -i|--install)
    banner
    install
    echo "Ready To Hunt..."
    ;;
  -h|--help)
    banner
    help
    ;;
  *)
    banner
    help
    ;;
esac
