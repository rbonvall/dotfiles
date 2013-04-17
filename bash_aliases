#!/bin/bash

alias df='df -h'
alias yum='yum -y'
alias mplayer='mplayer -really-quiet'
alias am='alsamixer -c 0'
alias cal='cal -m'
alias tree='tree -CA --dirsfirst'
alias ed='ed -p "ed> "'
alias serve='python -m SimpleHTTPServer'
alias curl='curl --silent'

gh () {
    if [[ "$1" =~ / ]]
    then
        url="https://github.com/$1"
    else
        url="git@github.com:rbonvall/$1"
    fi
    git clone $url
}
