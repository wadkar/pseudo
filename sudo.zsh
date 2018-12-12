# Note that unlike bashrc, zshrc is only sourced in interactive mode. Therefore
# we should ideally set the environment variables in .zprofile, but we hope
# that the OS manufacturer has set those properly in a system wide fashion in
# /etc/zprofile and configure our DEV environment here. Use following for a
# plain old bash with defaultish environment: `env -i HOME="$HOME" bash -l`
# See: https://superuser.com/a/1333539
typeset -U path fpath
# Respect .zshenv defaults unless we specifically want to alter them
export BROWSER="${BROWSER:=open}"
export EDITOR="${EDITOR:=vim}"
export VISUAL="${EDITOR:=vim}"
export PAGER="${PAGER:=less}"
export HISTFILE="~/.scratch/zhistory"
export HOMEBREW_NO_AUTO_UPDATE=1
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

#[[ -f ~/.config/zsh/powerlevel9krc.zsh ]] && source ~/.config/zsh/powerlevel9krc.zsh
[[ -f ~/.config/zsh/zpreztorc.zsh ]] && source ~/.config/zsh/zpreztorc.zsh
[[ -f ~/.config/zsh/zgenrc.zsh ]] && source ~/.config/zsh/zgenrc.zsh
#[[ -f ~/.config/zsh/zplugrc.zsh ]] && source ~/.config/zsh/zplugrc.zsh

# Override plugin defaults or settings
setopt histignorespace
unsetopt share_history
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=26'
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Pseudo aliases
[[ -f "${HOME}/.aliases.zsh" ]] && source "${HOME}/.aliases.zsh"
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "~/Downloads/packages/google-cloud-sdk/path.zsh.inc" ]; then
  source "~/Downloads/packages/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f '~/Downloads/packages/google-cloud-sdk/completion.zsh.inc' ]; then
  source '~/Downloads/packages/google-cloud-sdk/completion.zsh.inc'
fi
