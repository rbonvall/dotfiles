#!/bin/bash

alias df='df -h'
alias mplayer='mplayer -really-quiet'
alias am='alsamixer -c 0'
alias cal='cal -m'
alias tree='tree -CA --dirsfirst'
alias ed='ed -p "ed> "'
alias serve='python -m SimpleHTTPServer'
alias curl='curl --silent'
alias yt='youtube-dl -f 18 -t -c'
alias vim=nvim
alias up='docker-compose up'
alias install='sudo dnf install -y'

gimme () {
    local i
    for i in $(seq $1)
    do
        echo
    done
}

gh () {
    local url
    if [[ "$1" =~ / ]]
    then
        url="https://github.com/$1"
    elif [[ "$2" == / ]]
    then
        url="https://github.com/$1/$3"
    else
        url="git@github.com:rbonvall/$1"
    fi
    git clone $url
}

line () {
    local i
    for i in $(seq $COLUMNS)
    do
        echo -n "─"
    done
    echo
}
