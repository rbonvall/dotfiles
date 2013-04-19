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

gimme () {
    for i in $(seq $1)
    do
        echo
    done
}

gh () {
    if [[ "$1" =~ / ]]
    then
        url="https://github.com/$1"
    else
        url="git@github.com:rbonvall/$1"
    fi
    git clone $url
}

line () {
    for i in $(seq $COLUMNS)
    do
        echo -n "─"
    done
    echo
}

