# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/cosmin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
alias yy="tmux show-buffer | xclip -sel clip";
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias cd_raiden='cd /home/cosmin/Documents/github/work/raiden'
alias wr='workon raiden'
alias move_learning='cd /home/cosmin/Documents/github/learning';
alias activate_vpn='cd /home/cosmin/Documents/utility/VPN && sudo openvpn --config gw-UDP4-1196-cosmin.ams3.do.brainbot.com-config.ovpn';
alias weather='curl wttr.in/Cluj'
export ANDROID_HOME='/opt/android-sdk'
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Downloads/1.2.131.1/setup-env.sh
alias lic='cd /home/cosmin/Documents/github/learning/licenta/IKHNAIE';
alias ganache='/home/cosmin/Documents/github/learning/licenta/ganache-1.2.2-x86_64.AppImage';
alias performance_mode='sudo smbios-thermal-ctl --set-thermal-mode=Performance'
alias balanced_mode='sudo smbios-thermal-ctl --set-thermal-mode=Balanced'
alias lic_code='cd /home/cosmin/Documents/github/learning/circular-economy && code .'

alias DAW='cd /home/cosmin/Documents/github/learning/university/DAW'

export PATH="/home/cosmin/.gem/ruby/2.6.0/bin:$PATH"
export PATH="$PATH:/path/to/elixir/bin"
export EDITOR='nvim'
source ~/.bin/tmuxinator.zsh;

alias ws="i3-msg workspace 3; i3-msg exec /usr/bin/chromium; i3-msg workspace 1; i3-msg exec /usr/bin/terminal; i3-msg workspace 8; i3-msg exec /usr/bin/spotify; exec i3-msg workspace 1;";
alias tags="ctags -R --exclude=.git --exclude=node_modules --exclude=package.json";
alias graph="git log --all --decorate --oneline --graph";
alias ks="git stash";

alias shake="adb shell input keyevent 82";
alias reload="adb shell input keyevent 82; adb shell input keyevent 19; adb shell input keyevent 23;";
alias mount_alo="sudo mount 192.168.1.9:/var/www/html /home/cosmin/Documents/work/dev";
alias umount_alo="sudo umount /home/cosmin/Documents/work/dev";
alias lk="keylogger --log-file ~/.keylogger.log &"
alias open="pcmanfm ."
alias gpom="echo 'git push origin master'; git push origin master"
alias teamv="/home/cosmin/Downloads/teamviewer/teamviewer/teamviewer"
export SLACK_TOKEN="xoxp-180690228519-715010133862-918196961602-27c4b2a00c10599a9d523c23d442febc"
export SLACK_BOT_TOKEN="xoxp-180690228519-715010133862-918196961602-27c4b2a00c10599a9d523c23d442febc"
alias slack_apk_plopeanu="slack-cli -f /home/cosmin/Documents/work/plopeanu_v2/android/app/build/outputs/apk/release/plopeanu-v0.1.0.apk -d apk"
alias init_slack= 'eval "$(register-python-argcomplete slack-cli)"'
alias python3=python3
alias cdb='cd ./android/app/build/outputs/apk/release'
