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

# Initialize mpi
source /etc/profile.d/modules.sh
module load mpi/openmpi-x86_64

# powerline
#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi
eval "$(starship init bash)"

# Custom Alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ks='ls'
alias py='python3'
alias rice='python3 /home/chandler/Documents/instantrice/src/instant_rice.py'
alias donut='/home/chandler/Documents/./donut'
alias wttr='curl wttr.in'
alias pdf='mupdf -I'
alias bashrc='vim ~/.bashrc'
alias sp='pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo'
alias hp='pactl set-default-sink alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.Direct__hw_USB__sink'
alias god='llm -m orca-mini-3b-gguf2-q4_0'
alias sudo='sudo -p "gimme ur password bitch> "'
alias vps='kitten ssh chqn@chqn.xyz -p 420 -i ~/.ssh/server'
alias m='neomutt'
alias mu='/opt/musikcube_3.0.2_linux_x86/musikcube'
alias site='cd ~/Documents/chqn.jsx/'
alias suntar='sudo tar -xvzf'
set -o vi
fortune -s | cowsay
