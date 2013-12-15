PATH=/usr/local/bin:$PATH

alias ls='ls -FAG'
alias ll='ls -lrt'
alias ..='cd ..'
alias f='open .'

alias scpresume="rsync --partial --progress --rsh=ssh"

function exitstatus {
    EXITSTATUS="$?"
    BOLD="\[\033[1m\]"
    RED="\[\033[1;31m\]"
    GREEN="\[\e[32;1m\]"
    BLUE="\[\e[34;1m\]"
    OFF="\[\033[m\]"

    PROMPT="${GREEN}\u@\h:${BLUE}\w${OFF}\n$(__git_ps1 "(%s)")"

    if [ "${EXITSTATUS}" -eq 0 ]
    then
       PS1="${PROMPT}${BOLD}${GREEN}>${OFF} "
    else
       PS1="${PROMPT}${BOLD}${RED}>${OFF} "
    fi

    PS2="${BOLD}>${OFF} "
}

PROMPT_COMMAND=exitstatus

shopt -s nocaseglob
shopt -s cdspell

#
# git
#
source `dirname ${BASH_SOURCE}`/git-prompt.sh
source `dirname ${BASH_SOURCE}`/git-completion.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
#GIT_PS1_SHOWUPSTREAM="auto"
