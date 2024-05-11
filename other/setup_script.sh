#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
echo  "${RED} ░▒▓███████▓▒░ ░▒▓███████▓▒░     ░▒▓█▓▒░ ░▒▓████████▓▒░ ░▒▓███████▓▒░   ░▒▓██████▓▒░  ░▒▓███████▓▒░  ${WHITE}"
echo  "${RED}░▒▓█▓▒░               ░▒▓█▓▒░ ░▒▓████▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒░ ${WHITE}"
echo  "${RED}░▒▓█▓▒░               ░▒▓█▓▒░    ░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░               ░▒▓█▓▒░ ${WHITE}"
echo  "${RED} ░▒▓██████▓▒░  ░▒▓███████▓▒░     ░▒▓█▓▒░ ░▒▓██████▓▒░   ░▒▓███████▓▒░  ░▒▓█▓▒░        ░▒▓███████▓▒░  ${WHITE}"
echo  "${RED}       ░▒▓█▓▒░        ░▒▓█▓▒░    ░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░               ░▒▓█▓▒░ ${WHITE}"
echo  "${RED}       ░▒▓█▓▒░        ░▒▓█▓▒░    ░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒░ ${WHITE}"
echo  "${RED}░▒▓███████▓▒░  ░▒▓███████▓▒░     ░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██████▓▒░  ░▒▓███████▓▒░  ${WHITE}"
                                                                                                     
                                                                                                     


sudo apt update && sudo apt upgrade
sudo apt install git curl wget rlwrap net-tools speedtest-cli ffuf tmux sqlmap 2to3 python2-minimal python2 dh-python python-is-python3 zsh moreutils jq python3-pip python-pip -y
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo pip2 install --upgrade pip
sudo pip3 install --upgrade pip
sudo sqlmap --update
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
cp ~/.zshrc ~/.zshrc_backup
cat > ~/.zshrc << EOF
ZSH_THEME="wedisagree"
plugins=(git copybuffer vi-mode sudo)
source $ZSH/oh-my-zsh.sh
alias mm='md /tmp/a'
alias jj='cd /tmp/a'
alias c='clear'
alias x='exit'
alias ww='cd ~/docs/work && ls'
alias p='gaa && git commit -m "updated" && gp'
alias update='sudo snap refresh && sudo apt update && sudo apt upgrade -y && pdtm -ua'
alias bat='batcat'
alias webup='python3 -m http.server'
alias h='history | grep'
alias hi='history'
alias rl='rlwrap nc -lvnp'
alias cb='xclip -selection clipboard'
alias vpn='sudo openvpn ~/docs/vpns/vpn.ovpn'
alias wvpn='cat ~/docs/work/.key && sudo openvpn ~/docs/vpns/work_bst.ovpn'
alias hvpn='sudo openvpn ~/docs/vpns/my_vps_vpn.ovpn'
alias ff='ffuf -H "User-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:115.0) Gecko/20100101 Firefox/115.0" -c -v -w /usr/share/SecLists/Fuzzing/bst.txt -u'
alias fff='ffuf -c -v -w /usr/share/SecLists/Discovery/Web-Content/directory-list-2.3-big.txt -u'
alias ifc="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}' | sed 's/inet //'"
alias xx8='x8 -w /usr/share/SecLists/Discovery/Web-Content/large-wordlist-params_62_782.txt -u'
alias x8='x8 -w /usr/share/SecLists/Discovery/Web-Content/small-wordlist-params_25_987.txt -u'
alias kali='docker start kali && docker attach kali'
alias myip='curl 2ip.ru'
alias rl='rlwrap nc -nvlp'
alias shutd='shutdown -h now'
alias pdtm='pdtm -bp $HOME/go/bin'
alias trash='echo "/home/toor/.local/share/Trash/files/"'

unalias gau
#GOROOT=/usr/local/go
#GOPATH=~/.go
#PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/home/toor/.cargo/bin
EOF
source ~/.zshrc
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
go install -v github.com/tomnomnom/anew@lates
go install github.com/BishopFox/sj@latest
md /tmp/a
cd /tmp/a
git clone https://github.com/danielmiessler/seclists
sudo mv seclists /usr/share/SecLists
pdtm -i interactsh-client,katana,nuclei,subfinder
setopt HIST_IGNORE_SPACE
pip install hashid dirsearch
python3 -m pip install --user pipx
python3 -m pip install --user --upgrade pipx
pip3 install updog