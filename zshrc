# .zshrc

# Autocompletion
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export LANG=en_US.UTF-8
export LC_CTYPE=$LANG

# The prompt: ">>" in red, followed by a space,
# followed by the trailing component of the current working directory.
autoload -U colors && colors
PROMPT="%{$fg_bold[red]%}>> %{$fg_bold[cyan]%}%c %{$reset_color%}"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# z
. `brew --prefix`/etc/profile.d/z.sh

# My exports
export EDITOR=vim

alias b="brew update && brew upgrade"
alias k="cd ~/Source/Kadona/kwallet-ios/"
alias ldf="ls -ld .* | grep -v ^d"

alias reset-simulators="snapshot reset_simulators"
alias clear-derived-data="rm -rf ~/Library/Developer/Xcode/DerivedData"

export NODE_PATH="/usr/local/lib/node_modules"

export CLICOLOR=1

# Postgres
export PGDATA=/usr/local/var/postgres

# Open `.xcworkspace` or `.xcodeproj`
function xc {
  proj="$(ls | grep "\.xcodeproj\|\.xcworkspace" | sort -r | head -1)"
  if [ -e "$proj" ]
  then open -a Xcode "$proj"
  else echo "No xcworkspace/xcodeproj file found in current directory."
  fi
}
