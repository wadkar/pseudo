echo 'Setting up a scratch directorys in ~/.scratch'
mkdir -p ~/.scratch/vim/{backup,swap,sessions,undo} ~/.config

echo 'Cloning zgen which manages zsh plugins into ~/.zgen'
brew list | grep -q git ; [[ $? -eq 0 ]] || brew install git
git clone 'https://github.com/tarjoilija/zgen.git' ~/.zgen/zgen
[[ -f ~/.zshrc ]] && echo 'Existing ~/.zshrc found'
echo 'Please copy/symlink the sudo.zsh file to ~/.zshrc'

echo 'Cloning tmux plugin manager into ~/.tmux/plugins/tpm'
git clone 'https://github.com/tmux-plugins/tpm.git' ~/.tmux/plugins/tpm
[[ -f ~/.tmux.conf ]] && echo 'Existing ~/.tmux.conf found'
echo 'Please copy/symlink tmux.conf to ~/.tmux.conf'
echo 'Please read now deprecated tmux-powerline configuration from here:'
echo 'https://github.com/erikw/tmux-powerline#deprecation-warning'
echo 'Use your judgement and shell-foo to setup tmux-powerlinerc'

echo 'Change the prompt theme to pure in sudo.zsh around line#42'
echo 'Best viewed with iTerm2 v3; input.fontbureau.com in anonymous pro style'
echo 'To see the fancy icons tap into homebrew-cask-fonts as follows:'
echo 'brew tap homebrew/cask-fonts'
echo 'brew cask install font-anonymouspro-nerd-font-mono'
echo 'Dont forget to set iTerm2 Preferences -> Profiles -> Text -> Change Font'
echo 'Select Use different font for non-ASCII text -> Change Non-ASCII Font'
echo 'Select the Anonymouse Pro in the fixed with section'

