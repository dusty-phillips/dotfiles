# Managing dot files (https://www.atlassian.com/git/tutorials/dotfiles)
# curl -Lks https://is.gd/B5GXbi | /bin/bash
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

set -o emacs # Don't want zsh in vi mode even if $EDITOR is nvim

# zmodload zsh/zprof # for when things get too slow

export CLICOLOR=1
export LICOLOR_FORCE=1
source ~/.lscolors.sh
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

export FZF_DEFAULT_COMMAND="fd --follow --exclude Library"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type directory"

# zinit snippet  OMZ::plugins/dirhistory/dirhistory.plugin.zsh
zinit snippet  OMZ::plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
zinit light zdharma-continuum/fast-syntax-highlighting
zinit pack"bgn-binary+keys" for fzf
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

HOMEBREW_CELLAR="${HOMEBREW_CELLAR:-/usr/local/Cellar}"
export _ZL_FZF_FLAG='+s'
eval "$(lua $HOMEBREW_CELLAR/z.lua/1.8.16/share/z.lua/z.lua --init zsh once fzf)"

export EDITOR='hx'
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY_TIME
setopt SHARE_HISTORY

bindkey -M vicmd '^R' fzf-history-widget


unalias l 2>/dev/null
alias 14="reset&&z -I .\n"  # weird trick for escape sequence issue
alias ls='ls --color=auto'
alias lg='lazygit'
alias n=nvim
alias pn='poetry run nvim -c "Telescope find_files"'
alias d=deactivate
alias v="source .venv/bin/activate"
alias nautical="kitty +kitten ssh dustyphillips@dusty-nautical.local"
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f'
alias dps='docker ps'
alias mng='docker exec -it nautical-api-api-1 ./manage.py shell_plus'
alias dsh='docker exec -it nautical-api-api-1 /bin/bash'


# function z {
#   if  selected=$(fasd -dlR | fzf --no-sort --height 10%)  ; then
#       cd $selected
#   fi
# }
bindkey -s "^[r" "z -I .\n"

function l {
 if [ $1 ] ; then
    nvim $@
  else
   nvim -c "Telescope find_files"
 fi

}

function pt {
  ptw -- --tb=short $@
}

export PY_DEVTOOLS_HIGHLIGHT=1
export PYTHONPATH="$PYTHONPATH:$HOME/.pythonpath"
export PYTHONBREAKPOINT='IPython.core.debugger.set_trace'
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH:$HOME/.local/bin
eval "$(pyenv init -)"

# config not visible in public dotfiles repo
if [ -e $HOME/.zshrc-local ] ; then
  source ~/.zshrc-local
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/dustyphillips/.config/broot/launcher/bash/br
