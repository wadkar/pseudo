export ZPLUG_HOME='/usr/local/opt/zplug'
source "${ZPLUG_HOME}/init.zsh"
source "${HOME}/.config/zsh/zpreztorc.zsh"

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "modules/environment", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/archive", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/docker", from:prezto
zplug "modules/git", from:prezto
zplug "modules/history", from:prezto
#zplug "modules/homebrew", from:prezto
zplug "modules/node", from:prezto

zplug "modules/python", from:prezto
#zplug "modules/spectrum", from:prezto
#zplug "modules/ssh", from:prezto
#zplug "modules/tmux", from:prezto
zplug "djui/alias-tips", from:prezto
zplug "Tarrasch/zsh-autoenv"
zplug "rupa/z", from:github, use:z.sh

zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*"

zplug "denysdovhan/spaceship-prompt", from:github, use:spaceship.zsh, as:theme

zplug "modules/completion", from:prezto
zplug "modules/syntax-highlighting", from:prezto
zplug "modules/autosuggestions", from:prezto
zplug "modules/history-substring-search", from:prezto

if ! zplug check; then
  zplug install
fi
zplug load
