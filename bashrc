#!/bin/bash

[ -z "$PS1" ] && return

for file in /etc/bashrc /etc/bash_completion ~/.bash_aliases
do
  [ -f $file ] && . $file
done

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

ssh_agent_prompt() {
  ssh-add -l > /dev/null 2> /dev/null && echo ' ⚡'
}

set_ps1() {
  if [ $TERM != 'dumb' ]
  then
    local NORMAL="$(tput sgr0)"
    local HOST_STYLE="$(tput setaf 0)"
    local SEPARATOR_STYLE="$(tput setaf 6)"
    local WORK_DIR_STYLE=""
    local BRANCH_STYLE="$(tput setaf 3)"
    local PROMPT_STYLE="$(tput setaf 6)"
    local SSH_AGENT_STYLE="$(tput setaf 1)"
  fi

  local HOST="\[$HOST_STYLE\]\h\[$NORMAL\]"
  local SEPARATOR="\[$SEPARATOR_STYLE\]:\[$NORMAL\]"
  local WORK_DIR="\[$WORK_DIR_STYLE\]\w\[$NORMAL\]"
  local BRANCH="\[$BRANCH_STYLE\]\$(__git_ps1 2>/dev/null)\[$NORMAL\]"
  local SSH_AGENT="\[$SSH_AGENT_STYLE\]\$(ssh_agent_prompt)\[$NORMAL\]"
  local PROMPT="\[$PROMPT_STYLE\]\$\[$NORMAL\]"

  export PS1="$WORK_DIR$BRANCH$SSH_AGENT$PROMPT "
}
set_simple_ps1() {
  if [ $TERM != 'dumb' ]
  then
    local NORMAL="$(tput sgr0)"
    local PROMPT_STYLE="$(tput setaf 6)"
  fi
  local PROMPT="\[$PROMPT_STYLE\]:;\[$NORMAL\]"

  export PS1="$PROMPT "
}
set_ps1

for file in ~/.bash_python
do
  [ -f $file ] && . $file
done

export LANG=es_CL.utf8
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

unset command_not_found_handle
