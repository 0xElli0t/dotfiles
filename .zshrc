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
alias ll="ls -la"
alias nc="ncat"
alias r="ranger"
alias die="poweroff"
alias rm="$HOME/.local/bin/safe_rm"

# keybinds
bindkey -s "^p" "pwd\n"
bindkey -s "^h" "htop\n"
bindkey -s "^r" "ranger\n"

# safe-ish way to empty trash
empty_trash(){
	echo "$(find $HOME/.Trash/* | wc -l) file(s) will be deleted"
	echo -n "continue? [y/N] "
	read choice

	if [[ $choice == "y" ]]; then
		/bin/rm -rf $HOME/.Trash/*
	fi
}

# auto cd to last pwd
cd $(cat $HOME/.cache/last_pwd)

# save pwd
pwd(){
	/bin/pwd && /bin/pwd > $HOME/.cache/last_pwd
}

# load plugins
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
