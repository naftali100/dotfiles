#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# source ~/.git-propmt.sh

if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

_git_ps1(){
    # red - dirty repo, uncommited changes
    # yello - commits to push
    # green - if nothing to commit, and all in sync
    # (orange - out of sync with origin (branch))
    # add branch +/- commits diff

    local RED="\033[0;31m"
    local GREEN="\033[0;32m"
    local NOCOLOR="\033[0m"
    local YELLOW="\033[0;33m"
    local BLACK="\033[0;30m"
    local ORANGE="\e[38;5;208m"

    # check if git repo
    local git_branch=$(git branch --show-current 2>/dev/null)
    if [ "$git_branch" != "" ];
    then
        local git_modified_color="${GREEN}"    
        local git_status=$(git status 2>/dev/null | grep "Your branch is ahead" 2>/dev/null)
        if [ "$git_status" != "" ]
        then
            git_modified_color="${YELLOW}"
            git_branch="$git_branch +"
        fi

        local git_status=$(git status --porcelain 2>/dev/null)
        if [ "$git_status" != "" ]
        then
            git_modified_color="${ORANGE}"
            git_branch="$git_branch *"
        fi
    
        git_branch="\033[0;34m─────\033[0;32m$git_modified_color($git_branch)${NOCOLOR}"
    fi

    echo -e $git_branch
}

_set_my_PS1() {
    OS_ICON=   # Replace this with your OS icon
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUPSTREAM="auto verbos name git"
    export GIT_PS1_DESCRIBE_STYLE="branch"
    export GIT_PS1_SHOWCOLORHINTS=true

    half=
    back_half=
    
    PS1="\n \[\033[0;34m\]╭─────\[\033[0;31m\]\[\033[0;37m\]\[\033[41m\] $OS_ICON \u \[\033[0m\]\[\033[0;31m\]\[\033[0;34m\]─────\[\033[0;32m\]$half\[\033[0;30m\]\[\033[42m\] \w \[\033[0m\]\[\033[0;32m\]$back_half\$(_git_ps1) \n \[\033[0;34m\]╰ \[\033[1;36m\]\$ \[\033[0m\]"
    # PS1='\[\e[0;36m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]:\[\e[38;5;123m\]\w\[\e[0m\]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_my_PS1
unset -f _set_my_PS1

#[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

# TODO: move this to inputrc
# bind '"\e[A":history-search-backward'
# bind '"\e[B":history-search-forward'

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1: Do not use for executable files!
    # Note2: uses mime bindings, so you may need to use
    #        e.g. a file manager to make some file bindings.

    local progs="xdg-open exo-open"     # One of these programs is used.
    local prog
    for prog in $progs ; do
        if [ -x /usr/bin/$xx ] ; then
            $prog "$@" >& /dev/null &
            return
        fi
    done
    echo "Sorry, none of programs [$progs] is found." >&2
    echo "Tip: install one of packages" >&2
    for prog in $progs ; do
        echo "    $(pacman -Qqo "$prog")" >&2
    done
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
################################################################################

# disable ctrl-s from freez the terminal
stty -ixon

# enable cd to folder without "cd" command
shopt -s autocd

[[ -f ~/.inputrc ]] && bind -f ~/.inputrc

# my aliases
if [ -f ~/.shell_common ]; then
    . ~/.shell_common
fi
PATH=~/.console-ninja/.bin:$PATH

if command -v vagrant >/dev/null 2>&1; then
    # >>>> Vagrant command completion (start)
    . /opt/vagrant/embedded/gems/gems/vagrant-2.3.7/contrib/bash/completion.sh
    # <<<<  Vagrant command completion (end)
fi
