export ZSH=/Users/brianfield/.oh-my-zsh
ZSH_THEME="afowler"
EDITOR="nvim"
plugins=(gitfast osx)
source $ZSH/oh-my-zsh.sh
eval "$(rbenv init -)"

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

. /usr/local/etc/profile.d/z.sh

export PATH="$HOME/.cargo/bin:$PATH"
