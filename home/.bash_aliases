alias cds="cd /Users/brad.beeler/Sites/ionic_collab"
alias cdjm="cd /Users/brad.beeler/Sites/jitsi-meet"
alias cdajm="cd /Users/brad.beeler/Sites/angular-jitsi-meet"
alias cdios="cd /Users/brad.beeler/Sites/ios-collab"

alias cc="cd $HOME/Sites/cc"
alias tcce="tail -n 100 -f /usr/local/tomcat/logs/cc.out"
alias lcce="less /usr/local/tomcat/logs/cc.out"

# Git Aliases
alias gup="git pull"
alias gc="git commit -a"
alias gco="git checkout"
alias gbl="git branch -a"
alias gl="git log --graph --pretty=oneline --abbrev-commit"
alias gs="git status"
alias gmm="git fetch origin master && git merge FETCH_HEAD"
alias gd="git diff"
alias gss="git stash save"
alias gsl="git stash list"
alias gsp="git stash pop"
alias grhh="git reset --hard HEAD"

# IOS Dev
alias rmdd="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias rmpp="rm -rf ~/Library/MobileDevice/Provisioning\ Profiles"

alias vi="vim -p"

# OS Aliases
alias stopSpotlight="sudo mdutil -a -i off"
alias startSpotlight="sudo mdutil -a -i on"

alias eh="sudo vi /etc/hosts"
alias ..="cd ../"
alias ...="cd ../../"
alias ll="ls -alh"

function rtack {
    if [ -z $1 ]; then
        echo "Useage rtack SEARCHSTRING"
    else
        if [ -d "src/app/components" ]; then
           cmd="ack ${1} src/app/components/"
           eval $cmd
           echo "Searing SRC for ${1}"
        else
            cmd="ack ${1}"
            eval $cmd
        fi
    fi
}

source ~/.bash_ajm
