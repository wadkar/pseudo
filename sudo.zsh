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

#[[ -f ~/git/pseudo/powerlevel9krc.zsh ]] && source ~/git/pseudo/powerlevel9krc.zsh
[[ -f ~/git/pseudo/zpreztorc.zsh ]] && source ~/git/pseudo/zpreztorc.zsh
[[ -f ~/git/pseudo/zgenrc.zsh ]] && source ~/git/pseudo/zgenrc.zsh
#[[ -f ~/git/pseudo/zplugrc.zsh ]] && source ~/git/pseudo/zplugrc.zsh

# Override plugin defaults or settings
setopt histignorespace
unsetopt share_history
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=26'
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Pseudo aliases
[[ -f "${HOME}/.aliases.zsh" ]] && source "${HOME}/.aliases.zsh"
alias mkalias='${EDITOR:=vi} ${HOME}/.aliases.zsh && source ${HOME}/.aliases.zsh'
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Put your customizations here
export HOMEBREW_NO_AUTO_UPDATE=true
