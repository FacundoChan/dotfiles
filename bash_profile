export PATH=/Users/chan/Library/Python/3.9/bin/:$PATH
export PATH=/Users/chan/miniforge3/bin:$PATH
export PS1="[%T] (ﾉ>ω<)ﾉ %/ $ "
alias g++="g++ -std=c++17"

# Neovim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export M2_HOME=/Library/apache-maven-3.5.4
export PATH=$PATH:$M2_HOME/bin

# alias tree="find . -print | sed -e 's;[^/]*/;|_;g;s;_|; |;g'"
alias ll="ls -alhF"
alias goland="/usr/local/bin/goland"
alias nv="nvim"

# Git Aliases
alias gaa="git add --all"
alias gc="git commit -v"
alias gst="git status"

# Remove Aliases
alias rm="rm -i"

# Move Aliases
# Prompt for confirmation before overwriting existing files, regardless of file permissions
alias mv="mv -i"

# Disable brew auto update
export HOMEBREW_NO_AUTO_UPDATE=1

mcd() {
	mkdir -p "$1"
	cd "$1"
}

source /Users/chan/.config/broot/launcher/bash/br
