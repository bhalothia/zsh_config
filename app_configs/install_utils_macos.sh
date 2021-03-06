#!/bin/zsh
SELF_DIR="$(dirname "$0")"
cd "$SELF_DIR"

sudo -v # ask for password

# install homebrew
command -v brew >/dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

! brew cask list qlstephen >/dev/null && brew cask install qlstephen
! brew cask list qlmarkdown >/dev/null && brew cask install qlmarkdown
! brew cask list qlcolorcode >/dev/null && brew cask install qlcolorcode

# ! brew list coreutils >/dev/null && brew install coreutils # http://www.gnu.org/software/coreutils/manual/coreutils.pdf

! brew list calc >/dev/null && brew install calc # http://www.isthe.com/chongo/tech/comp/calc/

! brew list git >/dev/null && brew install git

! brew list tldr >/dev/null && brew install tldr # https://github.com/tldr-pages/tldr
! brew list cheat >/dev/null && brew install cheat

! brew list zsh >/dev/null && brew install zsh
! brew list pwgen >/dev/null && brew install pwgen

! brew list vim >/dev/null && brew install vim
! brew list micro >/dev/null && brew install micro # https://github.com/zyedidia/micro
! brew list fzf >/dev/null && brew install fzf # https://github.com/junegunn/fzf # install shell extensions /usr/local/opt/fzf/install
# ! brew list fzy >/dev/null && brew tap jhawthorn/fzy && brew install fzy # https://github.com/jhawthorn/fzy
! brew list htop >/dev/null && brew install htop # better top
! brew list nmap >/dev/null && brew install nmap
! brew list mtr >/dev/null && brew install mtr # ping and trace combined : http://www.bitwizard.nl/mtr/
! brew list tmux >/dev/null && brew install tmux # https://github.com/tmux/tmux
! brew list the_silver_searcher >/dev/null && brew install the_silver_searcher # command: ag; better find https://github.com/ggreer/the_silver_searcher
! brew list irssi >/dev/null && brew install irssi # https://github.com/irssi/irssi
! brew list watch >/dev/null && brew install watch
! brew list watchman >/dev/null && brew install watchman # https://facebook.github.io/watchman

! brew list tree >/dev/null && brew install tree
! brew list pstree >/dev/null && brew install pstree
! brew list ncdu >/dev/null && brew install ncdu

! brew list ifstat >/dev/null && brew install ifstat
! brew list ipcalc >/dev/null && brew install ipcalc

! brew list httpie >/dev/null && brew install httpie # better alternative to curl
! brew list httpry >/dev/null && brew install httpry # http sniffer https://github.com/jbittel/httpry
! brew list w3m >/dev/null &&  brew install w3m # terminal browser

! brew list oath-toolkit >/dev/null && brew install oath-toolkit # generate OTP Codes
! brew list zbar >/dev/null && brew install zbar # read qr-code images e.g. command: zbarimg qr.png
# ! brew list tesseract >/dev/null && brew install tesseract --with-all-languages # ocr https://github.com/tesseract-ocr/tesseract

! brew list siege >/dev/null && brew install siege # benchmark http # https://github.com/JoeDog/siege
! brew list vegeta >/dev/null && brew install vegeta # benchmark http # https://github.com/tsenart/vegeta

! brew list jq >/dev/null && brew install jq # json parser

! brew list gotty >/dev/null && brew install yudai/gotty/gotty

! brew list dnsmasq >/dev/null && brew install dnsmasq # e.g. wildcard dns server *.localhost
sudo mkdir -p /etc/resolver && sudo tee /etc/resolver/localhost <<< 'nameserver 127.0.0.1' >/dev/null # add dnsmasq as resolver

! brew list socat >/dev/null && brew install socat

# ! brew list docker-clean >/dev/null && brew install docker-clean #  docker cleanup script
! brew list ctop >/dev/null && brew install ctop #  docker cleanup script


! brew list node >/dev/null && brew install node # js runtime evironment

! brew list gource >/dev/null && brew install gource # software version control visualization http://gource.io


npm install --global http-server # http server to serve current directory
npm install --global localtunnel

# brew cask install java
# ! brew list jenv >/dev/null && brew install jenv
