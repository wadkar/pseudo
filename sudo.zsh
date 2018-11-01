# Note that unlike bashrc, zshrc is only sourced in interactive mode. Therefore
# we should ideally set the environment variables in .zprofile, but we hope
# that the OS manufacturer has set those properly in a system wide fashion in
# /etc/zprofile and configure our DEV environment here. Use following for a
# plain old bash with defaultish environment: `env -i HOME="$HOME" bash -l`
# See: https://superuser.com/a/1333539
typeset -U path fpath
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
# TODO: Get other two from genie.server
export BROWSER='open'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export HISTFILE="~/.scratch/zhistory"
# Because pyenv shims are picked before brew in $PATH,
# `brew install` picks them for python bindings;
# We need to remove them from the $PATH when calling brew
# See: https://github.com/pyenv/pyenv/issues/106
brew() {
  if command -v pyenv &>/dev/null; then
    /usr/bin/env PATH="${PATH//$(pyenv root)\/shims:/}" /usr/local/bin/brew "$@"
  else
    /usr/local/bin/brew "$@"
  fi
}

# Plugin configuration that goes before initialization
POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( \
  # operating environment
  os_icon root_indicator context dir vcs \
  # runtime environment
  background_jobs status \
  newline \
  status \
  )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( \
  go_version \
  node_version \
  pyenv \
  rbenv \
  java_version \
)

POWERLEVEL9K_VI_INSERT_MODE_STRING='I'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# I'm not interested in knowing `whoami`
DEFAULT_USER="$(whoami)"


source "${HOME}/.zgen/zgen/zgen.zsh" && if ! zgen saved; then
  # We will mostly make use of prezto modules for configuration, see:
  # https://github.com/sorin-ionescu/prezto/tree/master/modules
  # Go through individual module's README.md to understand these settings
  zgen prezto prompt theme 'pure'
  zgen prezto editor key-bindings 'vi'
  zgen prezto editor dot-expansion 'yes'
  zstyle ':prezto:module:editor:info:keymap:primary' format '>>>'
  zgen prezto git 'log:context:format' 'brief'
  zgen prezto git 'log:online:format' '%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
  zgen prezto git 'status:ignore:submodules' 'all'
  zgen prezto '*:*' case-sensitive 'no'
  zgen prezto '*:*' color 'yes'
  :<<'TODO'
  #zgen prezto python skip-virtualenvwrapper-init 'on'
  #zstyle ':prezto:module:python:virtualenv' auto-switch 'no'
  #zstyle ':prezto:module:completion:*:hosts' etc-host-ignores \
    '0.0.0.0' '127.0.0.1'
TODO
  # In prezto order of module initialization is important (yeah, it is)
  zgen prezto
  zgen prezto environment
  # XXX: This module sets up bracketed-paste-url-magic which improves security
  # when making copy pasta from the interweb. Don't trust the internet!!1 :lol:
  # See: http://cirw.in/blog/bracketed-paste
  zgen prezto utility
  # "middle" is "sorted"
  zgen prezto editor
  zgen prezto archive
  zgen prezto directory
  zgen prezto docker
  zgen prezto git
  zgen prezto history
  #zgen prezto homebrew
  #zgen prezto node
  #zgen prezto osx
  zgen prezto python
  #zgen prezto spectrum # for colors
  #zgen prezto ssh # TODO: setup ssh-agent
  #zgen prezto tmux # no need, we have tmux-continuum

  # Some non prezto stuff
  zgen load djui/alias-tips
  zgen load rupa/z
  #zplug "chrissicool/zsh-256color" # iTerm2 can export TERM="xterm-256color"
  #zgen load eventi/noreallyjustfuckingstopalready # See flu.sh() below

  # Finally zsh-completions, history-substring-search, and autocompletions
  zgen prezto completion
  zgen prezto syntax-highlighting
  zgen prezto autosuggestions
  zgen prezto history-substring-search
  zgen save
fi

# Override plugin defaults or settings
setopt histignorespace
unsetopt share_history
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=26'
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Pseudo aliases
[[ -f "${HOME}/.aliases.zsh" ]] && source "${HOME}/.aliases.zsh"
