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
sudo apt install git curl wget tilix rlwrap net-tools speedtest-cli libpcap-dev ffuf tmux sqlmap 2to3 python2-minimal python2 dh-python python-is-python3 zsh moreutils jq python3-pip python-pip -y
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo pip2 install --upgrade pip
sudo pip3 install --upgrade pip
sudo sqlmap --update
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
cp ~/.zshrc ~/.zshrc_backup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install python3.9
python3.9 -m pip install pwncat-cs
cat > ~/.zshrc << EOF
ZSH_THEME="wedisagree"
# ZSH_THEME="mgutz"
# ZSH_THEME="frisk"
plugins=(git copybuffer vi-mode sudo)
source $ZSH/oh-my-zsh.sh
alias mm='md /tmp/a'
alias jj='cd /tmp/a'
alias nn='md /tmp/b'
alias kk='cd /tmp/b'
alias c='clear'
alias x='exit'
alias ww='cd ~/docs/work && ls'
alias p='gaa && git commit -m "updated" && gp'
# alias update='sudo snap refresh && sudo apt update && sudo apt upgrade -y && pdtm -ua'
alias update='sudo snap refresh && sudo apt update && sudo apt upgrade -y'
alias bat='batcat'
alias webup='python3 -m http.server'
alias h='history | grep'
alias hi='history'
alias rl='rlwrap nc -lvnp'
alias cb='xclip -selection clipboard'
alias vpn='sudo openvpn ~/docs/vpns/vpn.ovpn'
alias wvpn='cat ~/docs/work/.key && sudo openvpn ~/docs/vpns/work_bst.ovpn'
alias hvpn='sudo openvpn ~/docs/vpns/my_vps_vpn.ovpn'
alias ff='ffuf -H "User-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:115.0) Gecko/20100101 Firefox/115.0" -c -v -w /opt/my_lists/bst.txt -u'
alias fff='ffuf -c -v -w /usr/share/SecLists/Discovery/Web-Content/directory-list-2.3-big.txt -u'
alias ferox='feroxbuster -w /opt/my_lists/bst.txt --no-state -u'
alias ifc="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}' | sed 's/inet //'"
alias xx8='x8 -w /usr/share/SecLists/Discovery/Web-Content/large-wordlist-params_62_782.txt -u'
alias x8='x8 -w /usr/share/SecLists/Discovery/Web-Content/small-wordlist-params_25_987.txt -u'
alias kali='docker start kali && docker attach kali'
alias myip='curl https://2ip.ru/'
alias rl='rlwrap nc -nvlp'
alias shutd='shutdown -h now'
# alias pdtm='pdtm -bp $HOME/go/bin'
alias trash='echo "/home/toor/.local/share/Trash/files/"'
alias e='exit'
alias vzsh='vim ~/.zshrc'
alias vhis='vim ~/.zsh_history'

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
# go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
go install github.com/OJ/gobuster/v3@latest
go install github.com/hakluke/hakip2host@latest
go install -v github.com/tomnomnom/anew@lates
go install github.com/BishopFox/sj@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/cemulus/crt@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/pwnesia/dnstake/cmd/dnstake@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/projectdiscovery/urlfinder/cmd/urlfinder@latest
go install github.com/tomnomnom/waybackurls@latest
md /tmp/a
cd /tmp/a
git clone https://github.com/danielmiessler/seclists
sudo mv seclists /usr/share/SecLists
# pdtm -i interactsh-client,katana,nuclei,subfinder,naabu,tldfinder
setopt HIST_IGNORE_SPACE
pip install hashid dirsearch
python3 -m pip install --user pipx
python3 -m pip install --user --upgrade pipx
pip3 install updog
# docker pull ubuntu
# docker run -d -t --name myubuntu ubuntu
# docker start myubuntu && docker exec -it myubuntu bash
# docker kill myubuntu
# :g/\;mv\|\;p\n\|\;ww\n\|\;\.\.\|\;h\ \|\;c\n\|\;hi\n\|\;.vpn\|\;jj\|\;mm\n\|\;ls\|\;cb\|\;wc\|\;ps\ \|\;cd\|\;pwd\|\;ifc\|\;kali\|\;source\|\;webup\|\;reboot\|\;update\|\;md\|\;\.\.\|\;htop\|\;vim\|\;la\|\;exit\|\;myip\|\;e\n/d

cat > /tmp/tilix.dconf << EOF
[/]
app-title='${title}'
control-scroll-zoom=true
copy-on-select=true
enable-wide-handle=true
focus-follow-mouse=true
middle-click-close=true
paste-strip-first-char=false
prompt-on-close=false
prompt-on-delete-profile=true
quake-height-percent=28
quake-hide-headerbar=false
quake-specific-monitor=0
quake-width-percent=64
recent-session-files=['/home/toor/docs/work/vkusno-i-tochka/trash/terminal-scan-ip.json', '/home/toor/docs/wo.json']
session-name='${title}'
sidebar-on-right=false
tab-position='top'
terminal-title-show-when-single=false
terminal-title-style='none'
theme-variant='system'
unsafe-paste-alert=false
use-overlay-scrollbar=true
use-tabs=true
warn-vte-config-issue=false
window-save-state=false
window-state=87040
window-style='disable-csd-hide-toolbar'

[keybindings]
app-preferences='<Primary><Alt>g'
session-add-down='<Primary><Shift>d'
session-add-right='<Primary><Shift>r'
session-resize-terminal-left='<Primary>less'
session-resize-terminal-right='<Primary>greater'
session-resize-terminal-up='<Primary><Shift>Up'
terminal-close='<Primary>n'
terminal-file-browser='<Primary><Shift>e'
terminal-page-up='<Shift>Page_Up'
terminal-profile-preference='<Primary><Shift>p'
terminal-reset='disabled'
terminal-reset-and-clear='<Primary><Shift>m'
terminal-save='<Shift><Super>p'
terminal-scroll-down='<Primary><Shift>j'
terminal-scroll-up='<Primary><Shift>k'
win-reorder-next-session='<Primary><Shift>Down'
win-switch-to-next-session='<Primary>Page_Down'

[profiles]
default='5c95d51e-e324-40a0-ad4d-2ec057fbb036'
list=['2b7c4080-0ddd-46c5-8f23-563fd3ba789d', '30190ff6-87b3-4e43-bf29-f4c67649e515', '1997fde8-27f8-4f80-ade7-c6669a8bb8ea', '5c95d51e-e324-40a0-ad4d-2ec057fbb036', '3ea5056c-67e6-45cb-b77d-30a690aca77c']

[profiles/1997fde8-27f8-4f80-ade7-c6669a8bb8ea]
allow-bold=true
automatic-switch=@as []
background-color='#1A1A25252626'
background-transparency-percent=0
backspace-binding='ascii-delete'
badge-color='#AC7EA8'
badge-color-set=false
badge-font='Monospace 12'
badge-position='northeast'
badge-text=''
badge-use-system-font=true
bold-color='#ffffff'
bold-color-set=false
bold-is-bright=true
cell-height-scale=1.0
cell-width-scale=1.0
cjk-utf8-ambiguous-width='narrow'
cursor-background-color='#000000'
cursor-blink-mode='system'
cursor-colors-set=false
cursor-foreground-color='#ffffff'
cursor-shape='block'
custom-command=''
custom-hyperlinks=@as []
default-size-columns=144
default-size-rows=46
delete-binding='delete-sequence'
dim-transparency-percent=0
draw-margin=80
encoding='UTF-8'
exit-action='close'
font='Monospace Semi-Condensed 12'
foreground-color='#A1B0B8'
highlight-background-color='#000000'
highlight-colors-set=false
highlight-foreground-color='#ffffff'
login-shell=false
notify-silence-enabled=false
notify-silence-threshold=0
palette=['#252525', '#FF5252', '#C3D82C', '#FFC135', '#42A5F5', '#D81B60', '#00ACC1', '#F5F5F5', '#708284', '#FF5252', '#C3D82C', '#FFC135', '#42A5F5', '#D81B60', '#00ACC1', '#F5F5F5']
rewrap-on-resize=true
scroll-on-keystroke=true
scroll-on-output=false
scrollback-lines=70000
scrollback-unlimited=false
select-by-word-chars='-,./?%&#:_'
shortcut='disabled'
show-scrollbar=true
terminal-bell='none'
terminal-title='${id}'
text-blink-mode='always'
triggers=@as []
use-custom-command=false
use-system-font=false
use-theme-colors=false
visible-name='material'

[profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d]
default-size-columns=80
draw-margin=80
font='Monospace Semi-Condensed 10.5'
scroll-on-output=false
show-scrollbar=true
terminal-bell='none'
terminal-title='${id}'
use-system-font=true
visible-name='Default'

[profiles/30190ff6-87b3-4e43-bf29-f4c67649e515]
allow-bold=true
automatic-switch=@as []
background-color='#000000'
background-transparency-percent=0
backspace-binding='ascii-delete'
badge-color='#ffffff'
badge-color-set=false
badge-font='Monospace 12'
badge-position='northeast'
badge-text=''
badge-use-system-font=true
bold-color='#ffffff'
bold-color-set=false
bold-is-bright=true
cell-height-scale=1.0
cell-width-scale=1.0
cjk-utf8-ambiguous-width='narrow'
cursor-background-color='#000000'
cursor-blink-mode='system'
cursor-colors-set=false
cursor-foreground-color='#ffffff'
cursor-shape='block'
custom-command=''
custom-hyperlinks=@as []
default-size-columns=160
default-size-rows=41
delete-binding='delete-sequence'
dim-transparency-percent=0
draw-margin=80
encoding='UTF-8'
exit-action='close'
font='Monospace Semi-Condensed 12'
foreground-color='#00FF00'
highlight-background-color='#000000'
highlight-colors-set=false
highlight-foreground-color='#ffffff'
login-shell=false
notify-silence-enabled=false
notify-silence-threshold=0
palette=['#2E2E34343636', '#CCCC00000000', '#4E4E9A9A0606', '#C4C4A0A00000', '#34346565A4A4', '#757550507B7B', '#060698209A9A', '#D3D3D7D7CFCF', '#555557575353', '#EFEF29292929', '#8A8AE2E23434', '#FCFCE9E94F4F', '#72729F9FCFCF', '#ADAD7F7FA8A8', '#3434E2E2E2E2', '#EEEEEEEEECEC']
rewrap-on-resize=true
scroll-on-keystroke=true
scroll-on-output=false
scrollback-lines=70000
scrollback-unlimited=false
select-by-word-chars='-,./?%&#:_'
shortcut='disabled'
show-scrollbar=true
terminal-bell='none'
terminal-title='${id}'
text-blink-mode='always'
triggers=@as []
use-custom-command=false
use-system-font=false
use-theme-colors=true
visible-name='main'

[profiles/3ea5056c-67e6-45cb-b77d-30a690aca77c]
allow-bold=true
automatic-switch=@as []
background-color='#272822'
background-transparency-percent=0
backspace-binding='ascii-delete'
badge-color='#AC7EA8'
badge-color-set=false
badge-font='Monospace 12'
badge-position='northeast'
badge-text=''
badge-use-system-font=true
bold-color='#ffffff'
bold-color-set=false
bold-is-bright=true
cell-height-scale=1.0
cell-width-scale=1.0
cjk-utf8-ambiguous-width='narrow'
cursor-background-color='#000000'
cursor-blink-mode='system'
cursor-colors-set=false
cursor-foreground-color='#ffffff'
cursor-shape='block'
custom-command=''
custom-hyperlinks=@as []
default-size-columns=120
default-size-rows=35
delete-binding='delete-sequence'
dim-transparency-percent=0
draw-margin=80
encoding='UTF-8'
exit-action='close'
font='Monospace Semi-Condensed 15'
foreground-color='#F8F8F2'
highlight-background-color='#000000'
highlight-colors-set=false
highlight-foreground-color='#ffffff'
login-shell=false
notify-silence-enabled=false
notify-silence-threshold=0
palette=['#272822', '#F92672', '#A6E22E', '#F4BF75', '#66D9EF', '#AE81FF', '#A1EFE4', '#F8F8F2', '#75715E', '#F92672', '#A6E22E', '#F4BF75', '#66D9EF', '#AE81FF', '#A1EFE4', '#F9F8F5']
rewrap-on-resize=true
scroll-on-keystroke=true
scroll-on-output=false
scrollback-lines=70000
scrollback-unlimited=false
select-by-word-chars='-,./?%&#:_'
shortcut='disabled'
show-scrollbar=true
terminal-bell='none'
terminal-title='${id}'
text-blink-mode='always'
triggers=@as []
use-custom-command=false
use-system-font=false
use-theme-colors=false
visible-name='material bit font'

[profiles/5c95d51e-e324-40a0-ad4d-2ec057fbb036]
allow-bold=true
automatic-switch=@as []
background-color='#272822'
background-transparency-percent=0
backspace-binding='ascii-delete'
badge-color='#AC7EA8'
badge-color-set=false
badge-font='Monospace 12'
badge-position='northeast'
badge-text=''
badge-use-system-font=true
bold-color='#ffffff'
bold-color-set=false
bold-is-bright=true
cell-height-scale=1.0
cell-width-scale=1.0
cjk-utf8-ambiguous-width='narrow'
cursor-background-color='#000000'
cursor-blink-mode='system'
cursor-colors-set=false
cursor-foreground-color='#ffffff'
cursor-shape='block'
custom-command=''
custom-hyperlinks=@as []
default-size-columns=144
default-size-rows=41
delete-binding='delete-sequence'
dim-transparency-percent=0
draw-margin=80
encoding='UTF-8'
exit-action='close'
font='Monospace Semi-Condensed 12'
foreground-color='#F8F8F2'
highlight-background-color='#000000'
highlight-colors-set=false
highlight-foreground-color='#ffffff'
login-shell=false
notify-silence-enabled=false
notify-silence-threshold=0
palette=['#272822', '#F92672', '#A6E22E', '#F4BF75', '#66D9EF', '#AE81FF', '#A1EFE4', '#F8F8F2', '#75715E', '#F92672', '#A6E22E', '#F4BF75', '#66D9EF', '#AE81FF', '#A1EFE4', '#F9F8F5']
rewrap-on-resize=true
scroll-on-keystroke=true
scroll-on-output=false
scrollback-lines=176544
scrollback-unlimited=false
select-by-word-chars='-,./?%&#:_'
shortcut='disabled'
show-scrollbar=true
terminal-bell='none'
terminal-title='${id}'
text-blink-mode='always'
triggers=@as []
use-custom-command=false
use-system-font=false
use-theme-colors=false
visible-name='monokai'
EOF
dconf load /com/gexperts/Tilix/ < /tmp/tilix.dconf