# Managing dot files (https://www.atlassian.com/git/tutorials/dotfiles)
# curl -Lks https://is.gd/B5GXbi | /bin/bash
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

bindkey -v


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

zinit snippet  OMZ::plugins/dirhistory/dirhistory.plugin.zsh
zinit snippet  OMZ::plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
zinit light zdharma-continuum/fast-syntax-highlighting
zinit pack"bgn-binary+keys" for fzf
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
eval "$(fasd --init zsh-hook)"

export EDITOR='nvim'
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


unalias rd 2>/dev/null
unalias l 2>/dev/null
alias ls='ls --color=auto'
alias n=nvim
alias d=deactivate

function z {
  cd $(fasd -dlR | fzf --no-sort --height 10%)
}
bindkey -s "^[r" "z\n"

function v {
  local VENV="${PWD##*/}.venv"
  if [ -e $VENV ] ; then
    . $VENV/bin/activate || true
  elif [ -e "venv_thm_local" ] ; then
    . venv_thm_local/bin/activate || true
  fi
}

function l {
 v
 if [ $1 ] ; then
    nvim $@
  else
   nvim -c "Telescope find_files"
 fi

}

function lg {
  v
  lazygit
}

function i {
  v
  inv $@
}

function pt {
  v
  ptw -- --tb=short $@
}

function dlogs {
  v
  i docker.logs | cut -f 2 -d '|'
}

export PY_DEVTOOLS_HIGHLIGHT=1
export PYTHONPATH="$PYTHONPATH:$HOME/.pythonpath"
export PYENV_ROOT=~/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"

# config not visible in public dotfiles repo
if [ -e $HOME/.zshrc-local ] ; then
  source ~/.zshrc-local
fi
