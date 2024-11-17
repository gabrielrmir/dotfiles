# path
PATH="$HOME/.cargo/bin/:$PATH"
PATH="$(go env GOBIN):$(go env GOPATH)/bin:$PATH"
PATH="$HOME/.config/composer/vendor/bin:$PATH"

export EDITOR="nvim"

# initialize plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

zinit snippet OMZP::sudo

# load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# keybinds
bindkey -e
bindkey '^[w' kill-region

# shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

alias ls="ls --color"

# prompt styling
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats ' %F{cyan}%s(%b)%f'
setopt prompt_subst
PS1='%F{green}[./%1~]%f${vcs_info_msg_0_} %B%F{blue}>%f%b '
