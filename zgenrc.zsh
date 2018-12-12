ZGEN_RESET_ON_CHANGE=( \
  ${HOME}/.zshrc \
  ${HOME}/.config/zsh/zpreztorc.zsh \
  ${HOME}/.config/zsh/zgenrc.zsh \
)
source "${HOME}/.zgen/zgen/zgen.zsh"

if ! zgen saved; then
  # We will mostly make use of prezto modules for configuration, see:
  # https://github.com/sorin-ionescu/prezto/tree/master/modules
  # Go through individual module's README.md to understand these settings
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
  zgen prezto node
  #zgen prezto osx
  zgen prezto python
  #zgen prezto spectrum # for colors
  #zgen prezto ssh # TODO: setup ssh-agent
  #zgen prezto tmux # no need, we have tmux-continuum

  # themes: be pure
  zgen prezto prompt theme 'pure'
  #zgen prezto prompt theme 'powerlevel9k'
  #zgen prezto contrib-prompt
  #zgen prezto prompt theme 'spaceship'
  #zgen load bhilburn/powerlevel9k powerlevel9k next
  #zgen load denysdovhan/spaceship-prompt spaceship

  # Some non prezto stuff
  zgen load djui/alias-tips
  zgen load rupa/z
  #zgen load psprint/zsh-navigation-tools
  #zplug "chrissicool/zsh-256color" # iTerm2 can export TERM="xterm-256color"
  #zgen load eventi/noreallyjustfuckingstopalready # See flu.sh() below

  # Finally zsh-completions, history-substring-search, and autocompletions
  zgen prezto completion
  zgen prezto syntax-highlighting
  zgen prezto autosuggestions
  zgen prezto history-substring-search
  zgen save
fi
