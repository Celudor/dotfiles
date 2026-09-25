# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# Options
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt no_beep
setopt inc_append_history

HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[ -s "$HOME/.zsh_aliasses" ] && \. "$HOME/.zsh_aliasses"

alias vim='nvim'
alias cat='bat'
alias grep='rg --color=auto'

alias ls='eza --icons=always --group-directories-first'
alias la='eza --all --icons=always --group-directories-first'
alias ll='eza --long --all --git --icons=always --group-directories-first'
alias tree='eza --tree --icons'


[ -s "$HOME/.local/bin/env" ] && \. "$HOME/.local/bin/env"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:/opt/nvim-linux-x86_64/bin:$HOME/.local/bin

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "$HOME/.config/bayer/bayer.sh" ] && \. "$HOME/.config/bayer/bayer.sh"

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
