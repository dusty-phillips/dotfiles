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


 export FZF_DEFAULT_COMMAND="fd --exclude Library"
 export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
 export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type directory"

zinit snippet  OMZ::plugins/copydir/copydir.plugin.zsh
zinit snippet  OMZ::plugins/copyfile/copyfile.plugin.zsh
zinit snippet  OMZ::plugins/dirhistory/dirhistory.plugin.zsh
zinit snippet  OMZ::plugins/fzf/fzf.plugin.zsh
zinit snippet  OMZ::plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

export EDITOR='nvim'


unalias rd 2>/dev/null
unalias l 2>/dev/null
alias n=nvim
alias d=deactivate
alias pt="ptw -- --tb=short"


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


export PY_DEVTOOLS_HIGHLIGHT=1
export PYTHONPATH="$PYTHONPATH:$HOME/.pythonpath"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion, but it's slow

# Created by `userpath` on 2021-03-16 18:26:12
export PATH="$PATH:$HOME/.local/bin"
# BEGIN auto nvm MANAGED BLOCK
export YVM_BOOTSTRAP_EXEC_PATH=$HOME/.tophat/.yvm-exec.sh
# END auto nvm MANAGED BLOCK

export YVM_DIR=$HOME/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
# BEGIN pyenv OSX MANAGED BLOCK
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
# END pyenv OSX MANAGED BLOCK
# BEGIN pyenv MANAGED BLOCK
export PYENV_ROOT=~/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
# END pyenv MANAGED BLOCK

# Created by `userpath` on 2021-11-05 16:50:19
export PATH="$PATH:$HOME/.local/bin:/Users/dustyphillips/Library/Python/3.8/bin"

# config not visible in public dotfiles repo
if [ -e .zshrc-local ] ; then
  source ~/.zshrc-local
fi

# Managing dot files (https://www.atlassian.com/git/tutorials/dotfiles)
alias config='/usr/bin/git --git-dir=/Users/dustyphillips/.cfg/ --work-tree=/Users/dustyphillips'
