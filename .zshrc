# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path
PATH="$HOME/.cargo/bin/:$PATH"
PATH="$(go env GOBIN):$(go env GOPATH)/bin:$PATH"
PATH="$HOME/.config/composer/vendor/bin:$PATH"

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
eval "$(zoxide init --cmd cd zsh)"

alias ls="ls --color"
alias c="nvim"
alias e="exit"

# bun completions
[ -s "/home/gabriel/.bun/_bun" ] && source "/home/gabriel/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"
