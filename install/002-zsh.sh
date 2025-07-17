mkdir -p ~/.zsh/plugins
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh/plugins/zsh-history-substring-search

cat >> ~/.zshrc << "EOF"
# ZSH
setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# System
export EDITOR="nvim"
export PATH=$PATH:$HOME/bin

alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Starship
eval "$(starship init zsh)"
EOF
