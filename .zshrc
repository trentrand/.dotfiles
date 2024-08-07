alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export DEFAULT_USER=`whoami`
export IP=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`

# Enable 8-bit color themes (actual theme set in Alacritty configuration)
export TERM=xterm-256color
ZSH_THEME="" # actual theme set iun
export PATH="/Applications/Alacritty.app/Contents/MacOS:$PATH"

# Install ZSH plugins with git submodules, no need for a plugin manager!
export ZSH_PLUGINS=$HOME/.dotfiles/plugins/zsh

# Plugins installed with default settings, more below inline with settings
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Handle switching between arm64 and x86_64 processor architectures
alias azsh="arch -arm64 zsh"
alias izsh="arch -x86_64 zsh"

if [ "$(uname -p)" = "i386" ]; then
  echo "Zsh session restarted with x86_64 binary"
  eval "$(/usr/local/homebrew/bin/brew shellenv)"
  alias brew='/usr/local/homebrew/bin/brew'
else
  # echo "Zsh session restarted with arm64 binary"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias brew='/opt/homebrew/bin/brew'
fi

# Enable vi insert mode bindings
bindkey -v
source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
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
fpath+=$ZSH_PLUGINS/pure
# fpath+=("$ZSH_PLUGINS/pure/pure.plugin.zsh", "$ZSH_PLUGINS/pure/async.zsh")
autoload -U promptinit; promptinit
prompt pure

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.homebrew/bin:$PATH"

# Import credentials as environment variables
source ~/.credentials

# Specify bin for default text editors, referenced by various programs and scripts
export EDITOR=vim
export REACT_EDITOR=vim

alias vi='. ~/nvim-fg-or-new.sh'
alias vim=nvim
alias lvim=nvim

# TODO: No longer needed after specifying id_rsa reference in ~/.ssh/config?
# SSH configuration
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# ssh-add --apple-use-keychain $HOME/.ssh/id_rsa  # prompt for passphrase once per login

# Image Editor configuration
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# pnpm
export PNPM_HOME="/Users/trand/Library/pnpm"
export PATH=$PNPM_HOME:$PATH

# deno
export DENO_INSTALL="/Users/trand/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Default command overwrites 😬
alias cat="bat"
# alias ls="exa"

# Time Machine
alias timemachine-fast-mode="sudo sysctl debug.lowpri\_throttle_enabled=0"
alias timemachine-restore-mode="sudo sysctl debug.lowpri\_throttle_enabled=1"
alias timemachine-prevent-sleep="echo \"Preventing sleep (3hr)!\" && caffeinate -t 10800 &"

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
# export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{.git/*,node_modules/*,**/.git/*,**/node_modules/*,**universal/fonts/*,**/*.class,**/network.har,**/MobileV7/*,**/__mocks__/**,**/i18n/*}'"
# export FZF_DEFAULT_COMMAND="rg --files --ignore-vcs --hidden -g '!{.git/*,node_modules/*,**/.git/*,**/node_modules/*,**universal/fonts/*,**/*.class,**/network.har,**/MobileV7/*,**/__mocks__/**,**/i18n/*}'"
# export FZF_DEFAULT_OPTS='
#   --reverse 
#   --bind "?:preview:cat {}"
#   --preview-window=down:50%:rounded:hidden
#   --preview "bat --color=always --style=header,grid --line-range :300 {}"
# '

alias ai=shai

autoload -U add-zsh-hook
# switch node version automatically when working directory has a .nvmrc file
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use > /dev/null
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# switch npm configuration automatically when working directory is within Developer directories
load-npmrc() {
  if [[ $PWD == ~/Developer/work* ]]; then
    npmrc work > /dev/null
  elif [[ $PWD == ~/Developer/personal* ]]; then
    npmrc personal > /dev/null
  fi
}
add-zsh-hook chpwd load-npmrc
load-npmrc

# Add various executables and command-line interfaces
export PATH=/usr/local/bin:$PATH # homebrew
export PATH=~/.local/bin:$PATH # user packages
# export PATH=~/bin:/usr/local/bin:$PATH # macOS default user-installed bin directories
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH" # vscode
alias get_emsdk="source ~/Developer/personal/emsdk/emsdk_env.sh" # emscripten
export PATH=/usr/local/go/bin:$PATH # Golang
export PATH=/usr/X11/bin/xhost:$PATH # X11 xhost: https://www.xquartz.org/

# Drone
export DRONE_SERVER=https://drone.squarespace.net
# export DRONE_TOKEN=$(security find-generic-password -a ${DEFAULT_USER} -s DRONE_TOKEN -w)

# Site-server local
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
# export PATH=/Library/Developer/CommandLineTools/usr/bin:$PATH
export CPATH=`xcrun --show-sdk-path`/usr/include

export PATH=$HOME/squarespace/generated/bin:$PATH
# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH=~/.npm-global/bin:$PATH

# Grant larger memory allocation limit to NodeJS
export NODE_OPTIONS=--max_old_space_size=6144 # 6GB

# C language
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# GNU Bin Utils
# PATH=/usr/local/opt/binutils/bin:$PATH
# PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
# PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
# export LDFLAGS="-L/usr/local/opt/binutils/lib"
# export CPPFLAGS="-I/usr/local/opt/binutils/include"

# iOS jailbreak development tool: https://github.com/theos/theos
export THEOS=/opt/theos
export PATH=$THEOS/bin:$PATH
export THEOS_DEVICE_IP=Bedroom.local THEOS_DEVICE_PORT=22

# ESP8266
# export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH # https://github.com/pfalcon/esp-open-sdk
# export PATH=~/.dotfiles/plugins/zsh/esptool:$PATH
# export PATH=~/Developer/personal/xtensa-lx106-elf/bin:$PATH
# export SDK_PATH=~/.dotfiles/plugins/zsh/esp-open-rtos
# export ESP_OPEN_RTOS_PATH=~/.dotfiles/plugins/zsh/esp-open-rtos

# ESP32
export IDF_PYTHON_ENV_PATH=/Users/trand/.espressif/python_env/idf4.2_py3.9_env
export IDF_PATH=~/Developer/personal/esp-idf
export PATH=~/Developer/personal/xtensa-esp32-elf/bin:$PATH
export ESPPORT=/dev/cu.usbserial-0001
alias get_idf='. $HOME/Developer/personal/esp-idf/export.sh'

# QMK
export PATH=/opt/homebrew/opt/avr-gcc@8/bin:$PATH

# MTA Arrival Times project configuration
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi
# export MTA_API_KEY=$(security find-generic-password -a ${DEFAULT_USER} -s MTA_API_KEY -w) # https://datamine.mta.info
export FIREBASE_SERVICE_ACCOUNT_KEY_PATH="~/mta-arrival-times-firebase-adminsdk-7c3wo-06ef218af8.json"
export GOOGLE_APPLICATION_CREDENTIALS="$FIREBASE_SERVICE_ACCOUNT_KEY_PATH"

# Ansible
export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible-vault-pw

# Custom aliases for frequently visited directories - view with `alias` command
alias Desktop='cd ~/Desktop'
alias Documents='cd ~/Documents'
alias Downloads='cd ~/Downloads'

alias Developer='cd ~/Developer'
  alias Personal='cd ~/Developer/personal'
    alias GitYank="cd ~/Developer/personal/git-yank"

  alias Work='cd ~/Developer/work'
    alias Rosetta="cd ~/Developer/work/core-components"
    alias Jsf="cd ~/Developer/work/Jsf"
    alias Rte="cd ~/Developer/work/rte"
      alias RteCore="cd ~/Developer/work/rte/rte-core"
      alias RteReact="cd ~/Developer/work/rte/rte-react"
    alias NBF="cd ~/Developer/work/new-bedford-framework"
    alias V6="cd ~/Developer/work/squarespace-v6"
      alias Aux="cd ~/Developer/work/squarespace-v6/aux-server"
    alias CF="cd ~/Developer/work/config-frontend"
    alias Site="cd ~/Developer/work/config-frontend"
      alias FrontendPackages="cd ~/Developer/work/config-frontend/site-server/src/main/webapp/frontend/packages"
        alias VisitorForms="cd ~/Developer/work/config-frontend/site-server/src/main/webapp/frontend/website/visitor-forms"
      alias Universal="cd ~/Developer/work/config-frontend/site-server/src/main/webapp/universal"
        alias App="cd ~/Developer/work/config-frontend/site-server/src/main/webapp/universal/src/apps/App"
        alias ContentBrowser="cd ~/Developer/work/config-frontend/site-server/src/main/webapp/universal/src/apps/App/screens/ContentBrowser"
        alias ConfigWebsite="cd ~/Developer/work/config-frontend/site-server/src/main/webapp/universal/src/apps/ConfigWebsite"

# Aliases for common Site Server V6 development processes
alias startproxy='cd ~/Developer/work/site-server-proxy && npm run start';
alias dockerstart="~/squarespace/generated/bin/squarespace-start.sh"
alias dockerstop="~/squarespace/generated/bin/squarespace-stop.sh"
alias gradlerun="./gradlew run -ProllupsReady=true -DUseMemcached=true"
alias gradleclean="./gradlew clean"
alias gradleruni18n="./gradlew run -DUseMemcached=true -Pi18n=true"

# Inject block-schemas into layout engine, then layout engine into v6
linkBlockSchemas() {
  pushd ~/Developer/work/block-editor-schemas;
  npm run build;
  cp -R dist/cjs ../config-frontend/site-server/src/main/webapp/universal/node_modules/@sqs/block-editor-schemas/dist;
  cp -R dist/lib ../config-frontend/site-server/src/main/webapp/universal/node_modules/@sqs/block-editor-schemas/dist;
  popd;
}

# "Link" @sqs/rte-react to the Frame/node_modules directory
linkRteReact() {
  cd ~/Developer/work/rte;
  cp -R rte-react/dist ~/Developer/work/config-frontend/site-server/src/main/webapp/universal/src/apps/Frame/node_modules/@sqs/rte-react;
}
# "Link" @sqs/rte-core to the Frame/node_modules directory
linkRteCore() {
  cd ~/Developer/work/rte;
  cp -R rte-core/dist ~/Developer/work/config-frontend/site-server/common/temp/node_modules/.pnpm/@sqs+rte-core@4.22.7/node_modules/@sqs/rte-core
}
# "Link" @sqs/section-controller-portal to the Frame/node_modulesdirectory
linkSectionControllerPortal() {
  cd ~/Developer/work/section-controller-portal;
  cp -R lib ~/Developer/work/config-frontend/site-server/src/main/webapp/universal/src/apps/Frame/node_modules/@sqs/section-controller-portal;
  cp -R lib ~/Developer/work/eight/node_modules/@sqs/section-controller-portal;
  cp -R lib ~/Developer/work/section-renderer/node_modules/@sqs/section-controller-portal;
  cp -R lib ~/Developer/work/config-frontend/site-server/src/main/webapp/universal/src/apps/Frame/node_modules/@sqs/section-renderer/node_modules/@sqs/section-controller-portal;
  echo "Section Controller Portal built files linked"
}
# "Link" @sqs/section-renderer to the Frame/node_modulesdirectory
linkSectionRenderer() {
  cd ~/Developer/work/section-renderer/lib;
  cp -R . ~/Developer/work/config-frontend/site-server/src/main/webapp/universal/node_modules/@sqs/section-renderer/lib;
  cd ~/Developer/work/section-renderer;
  echo "Section Renderer built files copied to config-frontend"
}
# Webpack build and "link" @sqs/section-renderer to the Frame/node_modulesdirectory
buildAndLinkSectionRenderer() {
  cd ~/Developer/work/section-renderer;
  npm run build;
  cd ~/Developer/work/section-renderer/lib;
  cp -R . ~/Developer/work/config-frontend/site-server/src/main/webapp/universal/node_modules/@sqs/section-renderer/lib;
  cd ~/Developer/work/section-renderer;
  echo "Section Renderer built and files copied to config-frontend"
}

fixLockfiles() {
  git checkout origin/master common/config/rush/pnpm-lock.yaml;
  npm run rush update;
}

resetJamf() {
  sudo /usr/local/bin/authchanger -reset -JamfConnect
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

alias close-notifications="killall NotificationCenter"

# Attach to tmux session of Ubuntu remote virtual machine
attachVm() {
	ssh trent@trent-VirtualBox.local -t tmux new-session -A -s vm
}
export PATH="$PATH:/Users/trand/.cargo/bin"
# source /Users/trand/Developer/personal/openpilot/tools/openpilot_env.sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
PATH=$PATH:/Users/trand/Developer/work/kubectl-plugins

vpn-status() {
  curl https://am.i.mullvad.net/connected
}

# Aliases for assets local workflows
export GIT_HOME=/Users/trand/Developer/work
alias assetspub="cd $GIT_HOME/assets/packages/asset-common && yalc publish && cd ../asset-picker && yalc publish && cd ../asset-uploader && yalc publish && cd ../asset-library && yalc publish && cd ../.."
alias assetslink="cd $GIT_HOME/config-frontend/site-server/src/main/webapp/universal/ && yalc link @sqs/asset-common && yalc link @sqs/asset-picker && yalc link @sqs/asset-uploader && yalc link @sqs/asset-library && cd $GIT_HOME/config-frontend/site-server"


export STM32_PRG_PATH=/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/trand/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# bun completions
[ -s "/Users/trand/.bun/_bun" ] && source "/Users/trand/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
