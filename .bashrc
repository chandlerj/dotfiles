# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

unset rc
. "$HOME/.cargo/env"


# Grabs the current branch if directory is git repository
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Sets custom bash prompt
# PS1="\[$(tput setaf 168)\]\u\[$(tput setaf 134)\]@\h \[$(tput setaf 74)\]\w\[$(tput setaf 164)\]\$(parse_git_branch)\[$(tput sgr0)\]$ "



# powerline term prompt
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi


#initialize openMPI environment

source /etc/profile.d/modules.sh
module load mpi/openmpi-x86_64


# Custom Alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias ks='ls'
alias py='python3'
alias pdf='mupdf -I'
alias rice='python3 /home/chandler/Documents/newTheme/src/instant_rice.py'
alias wttr='curl wttr.in'
alias vps='kitten ssh chqn@chandlerjustice.com'
alias pst='kitten clipboard --get-clipboard'
