# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export VISUAL=nvim
export EDITOR="$VISUAL"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
. "$HOME/.cargo/env"

alias vim="nvim"


parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#PS1="\[$(tput setaf 168)\]\u\[$(tput setaf 134)\]@\[$(tput setaf 74)\]\h \[$(tput setaf 164)\]\w \[$(tput sgr0)\]\$(parse_git_branch)$ "

PS1="\[$(tput setaf 168)\]\u\[$(tput setaf 134)\]@\h \[$(tput setaf 74)\]\w\[$(tput setaf 164)\]\$(parse_git_branch)\[$(tput sgr0)\]$"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
