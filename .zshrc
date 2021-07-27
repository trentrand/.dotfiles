alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export DEFAULT_USER=`whoami`
export IP=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`

# Get platform for platform-specific commands
platform=`uname`

# Enable 8-bit color themes (actual theme set in Alacritty configuration)
export TERM=xterm-256color
ZSH_THEME="" # actual theme set iun

# Install ZSH plugins with git submodules, no need for a plugin manager!
export ZSH_PLUGINS=$HOME/.dotfiles/plugins/zsh

# Plugins installed with default settings, more below inline with settings
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Enable vi insert mode bindings
bindkey -v
source $ZSH_PLUGINS/zsh-vim-mode/zsh-vim-mode.plugin.zsh
export KEYTIMEOUT=1

# Command completion
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true" # Use _ and - interchangeably, both will match

# Filter command history with current command
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Run Tmux automatically on zsh launch
if [ "$TMUX" = "" ]; then tmux attach || tmux new-session; fi

# Use minimal and fast Pure prompt plugin: https://github.com/sindresorhus/pure
fpath+=$ZSH_PLUGINS/pure/pure.plugin.zsh
autoload -U promptinit; promptinit
prompt pure

# Specify bin for default text editors, referenced by various programs and scripts
export EDITOR=vim
export REACT_EDITOR=vim

# SSH configuration
export SSH_KEY_PATH="~/.ssh/rsa_id"
# ssh-add $HOME/.ssh/id_rsa # prompt for passphrase once per login

# Default command overwrites 😬
if [ "$platform" = "Darwin" ]; then
  alias cat="bat"
  alias ls="exa"
fi

# Custom git commands
# TODO: Move these to ~/.dotfiles/plugins/git
export PATH=$PATH:~/Developer/personal/workflow-scripts/git
export PATH=$PATH:~/Developer/personal/git-yank
alias gitsquash='git reset --soft HEAD~$(git rev-list --count HEAD ^master)'
gitRewriteAuthor () {
  git filter-branch --env-filter '
  WRONG_EMAIL="trand@squarespace.com"
  NEW_NAME="Trent Rand"
  NEW_EMAIL="contact@trentrand.com"

  if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
  then
      export GIT_COMMITTER_NAME="$NEW_NAME"
      export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
  fi
  if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
  then
      export GIT_AUTHOR_NAME="$NEW_NAME"
      export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
  fi
  ' --tag-name-filter cat -- --branches --tags
}

# YDiff: https://github.com/ymattw/ydiff
export YDIFF_OPTIONS="--width 0 --side-by-side"

# FZF: https://github.com/junegunn/fzf
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{.git/*,node_modules/*,**/.git/*,**/node_modules/*,**universal/fonts/*,**/*.class,**/network.har,**/MobileV7/*}'"
export FZF_DEFAULT_OPTS="--layout=reverse" # --preview \"bat {}\""

# NVM - Node Version Manager: https://github.com/nvm-sh/nvm
export NVM_DIR="~/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Add various executables and command-line interfaces
export PATH=~/bin:/usr/local/bin:$PATH # macOS default user-installed bin directories
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH" # vscode
export PATH=~/Library/Python/2.7/bin:$PATH # python
export PATH=/usr/local/go/bin:$PATH # Golang
export PATH=/usr/X11/bin/xhost:$PATH # X11 xhost: https://www.xquartz.org/

# Drone
export DRONE_SERVER=https://drone.squarespace.net
export DRONE_TOKEN=$(security find-generic-password -a ${DEFAULT_USER} -s DRONE_TOKEN -w)

# Grant larger memory allocation limit to NodeJS
export NODE_OPTIONS=--max_old_space_size=8192

# GNU Bin Utils
PATH=/usr/local/opt/binutils/bin:$PATH
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
export LDFLAGS="-L/usr/local/opt/binutils/lib"
export CPPFLAGS="-I/usr/local/opt/binutils/include"

# iOS jailbreak development tool: https://github.com/theos/theos
export THEOS=/opt/theos
export PATH=$THEOS/bin:$PATH
export THEOS_DEVICE_IP=Bedroom.local THEOS_DEVICE_PORT=22

# ESP
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH # https://github.com/pfalcon/esp-open-sdk
export PATH=~/.dotfiles/plugins/zsh/esptool:$PATH
export PATH=~/Developer/personal/xtensa-lx106-elf/bin:$PATH
export SDK_PATH=~/.dotfiles/plugins/zsh/esp-open-rtos
export ESPPORT=/dev/tty.SLAB_USBtoUART
export ESP_OPEN_RTOS_PATH=~/.dotfiles/plugins/zsh/esp-open-rtos

# MTA Arrival Times project configuration
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi
export MTA_API_KEY=$(security find-generic-password -a ${DEFAULT_USER} -s MTA_API_KEY -w) # https://datamine.mta.info
export FIREBASE_SERVICE_ACCOUNT_KEY_PATH="~/mta-arrival-times-firebase-adminsdk-7c3wo-06ef218af8.json"
export GOOGLE_APPLICATION_CREDENTIALS="$FIREBASE_SERVICE_ACCOUNT_KEY_PATH"

# Custom aliases for frequently visited directories - view with `alias` command
alias Desktop='cd ~/Desktop'
alias Documents='cd ~/Documents'
alias Downloads='cd ~/Downloads'

alias Developer='cd ~/Developer'
  alias Personal='cd ~/Developer/personal'
    alias GitYank="cd ~/Developer/personal/git-yank"

  alias Work='cd ~/Developer/work'
    alias CC="cd ~/Developer/work/core-components"
    alias Eight="cd ~/Developer/work/eight"
    alias Jsf="cd ~/Developer/work/Jsf"
    alias Rte="cd ~/Developer/work/rte"
      alias RteCore="cd ~/Developer/work/rte/rte-core"
      alias RteReact="cd ~/Developer/work/rte/rte-react"
    alias SectionRenderer="cd ~/Developer/work/section-renderer"
    alias SectionPortal="cd ~/Developer/work/section-controller-portal"
    alias UBE="cd ~/Developer/work/block-schemas"
    alias V6="cd ~/Developer/work/squarespace-v6"
      alias Aux="cd ~/Developer/work/squarespace-v6/aux-server"
      alias Site="cd ~/Developer/work/squarespace-v6/site-server"
        alias Universal="cd ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal"
          alias App="cd ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal/src/apps/App"
          alias Frame="cd ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal/src/apps/Frame"

# Aliases for common Site Server V6 development processes
alias startproxy='cd ~/Developer/work/site-server-proxy && npm run start';
alias dockerstart="~/squarespace/generated/bin/squarespace-start.sh"
alias dockerstop="~/squarespace/generated/bin/squarespace-stop.sh"
alias gradlerun="./gradlew run -ProllupsReady=true -DUseMemcached=true"
alias gradleclean="./gradlew clean"
alias gradleruni18n="./gradlew run -DUseMemcached=true -Pi18n=true"

# Inject block-schemas into layout engine, then layout engine into v6
linkBlockSchemas() {
  cd ~/Developer/work/layout-engine;
  npm install --save ~/Developer/work/block-schemas
  cd ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal
  npm install --save ~/Developer/work/layout-engine
}

# "Link" @sqs/rte-react to the Frame/node_modules directory
linkRteReact() {
  cd ~/Developer/work/rte;
  cp -R rte-react/dist ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal/src/apps/Frame/node_modules/@sqs/rte-react;
}
# "Link" @sqs/rte-core to the Frame/node_modules directory
linkRteCore() {
  cd ~/Developer/work/rte;
  cp -R rte-core/dist ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal/src/apps/Frame/node_modules/@sqs/rte-core;
}
# "Link" @sqs/section-controller-portal to the Frame/node_modulesdirectory
linkSectionControllerPortal() {
  cd ~/Developer/work/section-controller-portal;
  cp -R lib ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal/src/apps/Frame/node_modules/@sqs/section-controller-portal;
  cp -R lib ~/Developer/work/eight/node_modules/@sqs/section-controller-portal;
  cp -R lib ~/Developer/work/section-renderer/node_modules/@sqs/section-controller-portal;
  cp -R lib ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal/src/apps/Frame/node_modules/@sqs/section-renderer/node_modules/@sqs/section-controller-portal;
  echo "Section Controller Portal built files linked"
}
# "Link" @sqs/section-renderer to the Frame/node_modulesdirectory
linkSectionRenderer() {
  cd ~/Developer/work/section-renderer/lib;
  cp -R . ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal/node_modules/@sqs/section-renderer/lib;
  cd ~/Developer/work/section-renderer;
  echo "Section Renderer built files copied to Squarespace-v6"
}
# Webpack build and "link" @sqs/section-renderer to the Frame/node_modulesdirectory
buildAndLinkSectionRenderer() {
  cd ~/Developer/work/section-renderer;
  npm run build;
  cd ~/Developer/work/section-renderer/lib;
  cp -R . ~/Developer/work/squarespace-v6/site-server/src/main/webapp/universal/node_modules/@sqs/section-renderer/lib;
  cd ~/Developer/work/section-renderer;
  echo "Section Renderer built and files copied to Squarespace-v6"
}

# Re-run a command until it returns -1
retryUntilFailure() {
  while "$@"; do :; done
}

# Combine two images into a side-by-side "Before and After" - e.g. `createBeforeAfter before.png after.png`
createBeforeAfter() {
  magick montage -pointsize 32 -label 'Before' $1 null: -label 'After' $2 -tile x1 -geometry +2+2 out.png
}

# Print terminal color palette for debugging theme
printColors() {
  curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
}

# Recursively delete all .DS_Store files in the current working directory
alias delete-dsstore="find . -name '.DS_Store' -type f -delete"
