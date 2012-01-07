setopt appendhistory histignorealldups extendedglob nomatch notify promptsubst
setopt noautocd nobeep
bindkey -v

export PAGER=less
export EDITOR=vim

source $HOME/.aliases

export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH

HISTFILE=$HOME/.histfile
HISTSIZE=1024
SAVEHIST=1024

if [ -d $HOME/.zsh.d ]; then
    for setup in $HOME/.zsh.d/*; do
        [ -x $setup ] && . $setup
    done; unset setup
fi
