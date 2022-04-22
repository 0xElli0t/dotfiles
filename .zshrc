# prompt
autoload -U colors && colors
PS1="%B%{$fg[blue]%}[%{$fg[red]%}%n%{$fg[green]%}@%{$fg[red]%}%M%{$fg[blue]%}]%{$fg[green]%}(%{$fg[magenta]%}%~%{$fg[green]%})%{$fg[black]%}$%{$reset_color%}%b "

# history
HISTFILE=$HOME/.cache/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

# vi mode
bindkey -v
export KEYTIMEOUT=1

# tab completion
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit

# vim keys for tab completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# aliases
alias ll="ls -lah"
alias nc="ncat"
alias r="ranger"
alias vim="nvim" 
alias die="poweroff"
alias rm="$HOME/.local/bin/safe_rm"

# keybinds
# allow using a keybind even if commadline contains text
__keybind_start="a &> /dev/null;"

bindkey -s "^p" "$__keybind_start pwd\n"
bindkey -s "^h" "$__keybind_start htop\n"
bindkey -s "^r" "$__keybind_start ranger\n"

# cd to last pwd on shell-start
cd $(cat $HOME/.cache/saved_pwd)

# save pwd
spwd(){
	pwd && pwd > $HOME/.cache/saved_pwd
}

# load plugins
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
