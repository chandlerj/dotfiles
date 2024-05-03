# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export BROWSER=firefox
export VISUAL=nvim
export EDITOR=nvim

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


# Grabs the current branch if directory is git repository
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

eval "$(starship init bash)"

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Custom Alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias ks='ls'
alias py='python3'
alias pdf='mupdf -I'
alias rice='python3 /home/chandler/Documents/InstantRice/src/instant_rice.py'
alias wttr='curl wttr.in'
alias vps='kitten ssh chqn@chqn.xyz -p 420 -i ~/.ssh/rsa_id'
alias pst='kitten clipboard --get-clipboard'
alias dim='brightnessctl set '
alias ls='ls --color=auto'
alias god='llm -m orca-mini-3b-gguf2-q4_0'
alias papes='cd /home/chandler/Pictures/papes/'
alias bashrc='nvim /home/chandler/.bashrc'
alias wisecow='fortune -s | cowsay'
fortune -s | cowsay
set -o vi


# DIRECT servers 
alias microgrid='kitten ssh microgrid@129.123.202.136'
alias direct='kitten ssh direct@129.123.175.63'

