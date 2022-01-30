alias ser="sudo wg-quick up wg0 || ssh n"

mkdir(){
        /bin/mkdir -pv "$1" && cd "$1"
}

#cd(){
#    [ -d "$1" ] && builtin cd "$1" && l
#}

# create new folder and name it as today date
# move the files to that folder  
rm(){
    folder_name=$(date +"%Y-%m-%d %T")
    /bin/mkdir -p ~/trash/"$folder_name"
    mv "$@" ~/trash/"$folder_name"
}

# easly commit all changes in folder
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

alias ty=yt
alias dc=cd
alias ..='cd ..'
alias cd..='cd ..'

alias c="clear"   
alias cls="clear" 

alias tf='tail -f'

alias ls=exa
alias l='ls -la '   # show long listing but no hidden dotfiles
alias ll='ls -laa '   # show long listing of all
alias lll='exa -Tla'

alias upload="scp"
alias p="cd ~/Documents/program"
alias service="systemctl"
alias sudo="sudo "

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

alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""

alias gg=ungit

alias top="btop"
alias htop="btop"

alias qr=qrencode

#alias off="shutdown now"
alias off="qdbus org.kde.Shutdown /Shutdown logoutAndShutdown"
alias reboot="qdbus org.kde.Shutdown /Shutdown logoutAndReboot"

#alias npm=pnpm
alias man="tldr -t ocean"
alias nam=man

alias ns="npm start"

alias nano="vim"
