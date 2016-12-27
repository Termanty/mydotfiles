export BROWSER=google-chrome

user=$(whoami)
if [ $user == "tero" ]; then
  echo ".bashrc setting for tero@x24"
fi
if [ $user == "termanty" ]; then
  echo ".bashrc settings for termanty at cs.helsinki enviroment"
  export NVM_DIR="/home/termanty/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm use 4.4.7
  export PATH=$PATH:~/vscode/
  export PATH=$PATH:~/xcape/
fi

export BROWSER=google-chrome
export PATH=$PATH:~/bin/

setxkbmap -option 'caps:escape'

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

