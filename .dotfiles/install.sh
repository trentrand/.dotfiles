dotfiles_command='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# TODO: prepend to file? only add if it doesn't exist.
echo "alias dotfiles='$dotfiles_command'" >> $HOME/.zshrc

# Default settings
eval $dotfiles_command config --local status.showUntrackedFiles no

# Install plugins stored as git submodules in ~/.dotfiles/plugins
eval $dotfiles_command submodule update --init --recursive

# Get platform for platform-specific commands
platform=`uname`

# Install plugins from Homebrew package manager
if [ "$platform" = "Darwin" ]; then
  brew install neovim
  brew install zsh-syntax-highlighting
  brew install zsh-vi-mode
  brew install tmux
    # install tmux plugin manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  brew install bat
  brew install exa
elif [ "$platform" = "Linux" ]; then
  sudo apt install neovim
fi


# Symbolically link plugins to required paths
ln -s ~/.dotfiles/plugins/zsh/nvm ~/.nvm
ln -s ~/.dotfiles/plugins/zsh/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
