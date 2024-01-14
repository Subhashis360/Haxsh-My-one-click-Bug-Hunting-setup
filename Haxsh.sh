#!/bin/bash
G='\033[1;32m'
NC='\033[0m'
CREATOR_NAME="SUBHASHIS"
GITHUB_LINK="https://github.com/Subhashis360"
CREATOR_ASCII="
            ___.   .__                  .__    .__        
  ________ _\_ |__ |  |__ _____    _____|  |__ |__| ______
 /  ___/  |  \ __ \|  |  \\__  \  /  ___/  |  \|  |/  ___/
 \___ \|  |  / \_\ \   Y  \/ __ \_\___ \|   Y  \  |\___ \ 
/____  >____/|___  /___|  (____  /____  >___|  /__/____  >
     \/          \/     \/     \/     \/     \/        \/ 
"

echo -e "${G}${CREATOR_ASCII}${NC}"

echo -e "${G}[+] Installing essential tools${NC}"
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get full-upgrade -y
sudo apt-get install -y python3-pip git

# Setup of Go lang
echo -e "${G}[+] Installing/updating Golang${NC}"
LATEST_GO_VERSION="$(curl --silent https://go.dev/VERSION?m=text)"
wget https://golang.org/dl/${LATEST_GO_VERSION}.linux-amd64.tar.gz
sudo tar -xvf ${LATEST_GO_VERSION}.linux-amd64.tar.gz -C /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
echo -e "${G}[+] Creating a directory to Store your weapons${NC}"
mkdir -p ~/Weapons
cd ~/Weapons/
tools=("github.com/projectdiscovery/pdtm/cmd/pdtm@latest"
       "https://github.com/aboul3la/Sublist3r.git"
       "https://github.com/nahamsec/lazyrecon.git"
       "github.com/tomnomnom/waybackurls@latest"
       "https://github.com/sqlmapproject/sqlmap.git"
       "github.com/ffuf/ffuf@latest"
       "github.com/OWASP/Amass/v3/...@master"
       "https://github.com/maurosoria/dirsearch.git"
       "https://github.com/wpscanteam/wpscan.git"
       "github.com/OJ/gobuster/v3@latest"
       "github.com/lc/gau/v2/cmd/gau@latest"
       "github.com/tomnomnom/assetfinder@latest"
       "https://github.com/rbsec/dnscan.git"
       "https://github.com/danielmiessler/SecLists.git")

echo -e "${G}[+] Installing tools in parallel${NC}"
for tool in "${tools[@]}"; do
    if [[ $tool == *github* ]]; then
        git clone $tool
    else
        go install -v $tool
    fi
done

echo -e "${G}[+] Setting up additional tools${NC}"
cd ~/Weapons/Sublist3r* && pip install -r requirements.txt
cd ~/Weapons/wpscan* && sudo gem install bundler && bundle install --without test

echo -e "${G}[+] Installation completed Enjoy Hacking..!${NC}"
