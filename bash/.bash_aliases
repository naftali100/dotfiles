ser(){
    if ifconfig wg0 &>/dev/null ; then
       ssh n
    else 
      echo 'opening wg'
      sudo wg-quick up wg0 
      ssh n
    fi
}

mkdir(){
    # use only last param and ignore all other mkdir params
    /bin/mkdir -pv "${@: -1}" && builtin cd "${@: -1}"
}

# if in python virtuall env auto source it 
# from: https://stackoverflow.com/a/50830617/12893054
function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./.env ]] ; then
        source ./.env/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}

# create new folder and name it as today date
# move the files to that folder  
rm(){
    # folder_name="$(date +"%Y-%m-%d %T") $(pwd)"
    folder_name="$(date +"%Y-%m-%d %T")"
    /bin/mkdir -p ~/trash/"$folder_name"
    mv "$@" ~/trash/"$folder_name"
}

# easily commit all changes in folder
# everything after the command will be the commit message
commit(){
    echo "add..."
    git add .
    echo "commit..."
    git commit -a -m "$*"
}

# same as above command and sign the commit
commits(){
   echo "add..."
    git add .
    echo "commit..."
    git commit -S11C0F30B96D4CBFE -a -m "$*"
}

run(){
    one=$1
    gcc -Wall $1 -o ${one%.*} 
    ./${one%.*} ${@:2} 
}
runpp(){
    one=$1
    g++ -Wall $1 -o ${one%.*}
    ./${one%.*} ${@:2}
}

killport () {
    if [ -z "$1" ] ; then
        echo "please specify a port to kill"
    else
        fuser -k $1/tcp
    fi
}

##########
# programs alises
##########

# youtube-dl
alias ty=yt

# cd mistakes
alias dc=cd
alias ..='cd ..'
alias cd..='cd ..'

alias c="clear"   
alias cls="clear" 

alias tf='tail -f'

alias ls=ranger
alias exa='exa --icons'
alias l='exa -la'   # show long listing
alias lll='exa -Tla' # show tree of all files

alias upload="scp"
alias p="cd ~/Documents/program"
alias service="systemctl"
alias sudo="sudo "

alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""

alias gg=ungit

alias top="btop"
alias htop="btop"

alias qr=qrencode

alias off="qdbus org.kde.Shutdown /Shutdown logoutAndShutdown"
alias reboot="qdbus org.kde.Shutdown /Shutdown logoutAndReboot"

#alias npm=pnpm
alias man="tldr -t ocean"
alias nam=man

alias ns="npm start"

alias nano="vim"

alias cat="bat"
alias less="bat"

alias grep="rg"

alias conf="/usr/bin/git -C $HOME/dotfiles "

##########
# COLORS
##########

# enable colors
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
