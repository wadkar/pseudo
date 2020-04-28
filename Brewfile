tap "homebrew/bundle"
tap "homebrew/core"
tap "homebrew/services"
brew "aria2"
brew "bat"
brew "fzf"
brew "git"
# restart the unbound service that gets installed as gnupg dependency
brew "unbound", restart_service: :changed
brew "gnupg"
brew "htop"
brew "lesspipe"
brew "neovim"
# ngrep is the network grepper, without full fledged wireshark
brew "ngrep"
brew "pinentry-mac"
brew "ripgrep"
brew "tmux"
brew "tree"
brew "wget"
brew "yarn"
brew "youtube-dl"
brew "zsh"
# these gets used by pyenv/rbenv (some are deps as well)
brew "openssl"
brew "readline"
brew "libyaml"
#it doesn't look like ruby-build picks up brew's libffi
#brew "libffi"
# don't need xz for pyenv; it'll download .tar.gz files just fine
#brew "xz"
