# path
PATH="$HOME/.cargo/bin/:$PATH"
PATH="$(go env GOBIN):$(go env GOPATH)/bin:$PATH"
PATH="$HOME/.config/composer/vendor/bin:$PATH"
PATH="$HOME/bin/:$PATH"

export EDITOR="nvim"
export MANPAGER='nvim +Man!'

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
eval "$(zoxide init zsh)"

alias ls="ls --color"
alias c="nvim"
alias e="exit"

# bun completions
[ -s "/home/gabriel/.bun/_bun" ] && source "/home/gabriel/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

PS1="[%F{yellow}%n%f:%F{blue}%1~%f]%0(#.#.$) "
PS2="> "
