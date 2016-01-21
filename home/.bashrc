export CLICOLOR=1

if [ -x $(brew --prefix nvm)/nvm.sh ]; then
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

export AWS_ACCESS_KEY_ID=AKIAIEKCXLUQWGSW2TOA
export AWS_SECRET_ACCESS_KEY=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

#
# enable bash_aliases by uncom the next 3 lines GU 12/1/2008
#
#
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
. ~/.git-completion.bash
fi

function _update_ps1() {
  PS1="$(~/powerline-shell/powerline-shell.py --mode flat --cwd-only $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ] && [ -x ~/powerline-shell/powerline-shell.py ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
else
  PS1="\h:\u \W> "
fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
