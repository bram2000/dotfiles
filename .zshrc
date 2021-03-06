 # If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=~/Code/go
export SCRIPTS=~/Scripts
export PATH=$PATH:$GOPATH/bin:$SCRIPTS
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
#export PATH=$PATH:"/Applications/Xcode.app/Contents/Applications/"
export PATH="/usr/local/Cellar/gnu-sed/4.5/bin/:$PATH"
export PATH="$PATH:/anaconda3/bin/"

# Path to your oh-my-zsh installation.
export ZSH=/Users/$(whoami)/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bram"
export BAT_THEME="TwoDark"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
# Don't load Node on startup
export NVM_NO_USE=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-nvm git osx brew pip docker docker-compose python pep8 pyenv iterm2 postgres httpie)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

setopt auto_cd 
cdpath=(/Users/jbramley/Code/madedotcom/; /Users/jbramley/Code/)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias rsml="rlwrap sml"
setopt APPEND_HISTORY
setopt no_share_history
DEFAULT_USER=$(whoami)

alias sl='ls'
alias gdt='git difftool'
alias j='jobs'

alias bat='bat -p'

alias vi='nvim'
alias vim='nvim'

alias :q='exit'

alias yq='shyaml get-value'

# Pygments
alias pcat='pygmentize -f terminal256 -O style=gruvbox -g'

function mdviewer(){
  pandoc $* | lynx -stdin
}

# brew - zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Add rbenv shims to the path
eval "$(rbenv init -)"

. /usr/local/etc/profile.d/z.sh

export GTAGSLABEL=pygments >> .profile
export PATH=/usr/local/Cellar/tidy-html5/5.6.0/bin/:$PATH

# Stop `brew doctor` from complaining about pyenv *-config scripts
# https://github.com/yyuu/pyenv/issues/106#issuecomment-94921352
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

source ~/.iterm2_shell_integration.zsh

# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[[ -f /Users/jbramley/.nvm/versions/node/v8.11.1/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh ]] && . /Users/jbramley/.nvm/versions/node/v8.11.1/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh
