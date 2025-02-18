# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export VISUAL=nvim
export EDITOR="$VISUAL"
export BROWSER=firefox
export XDG_SESSION_TYPE=X11
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


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Initialize mpi
# uncomment when openmpi is updated
#source /etc/profile.d/modules.sh
#module load mpi/openmpi-x86_64

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
alias vps='ssh chqn@chqn.xyz -p 420 -i ~/.ssh/server'
alias m='neomutt'
alias mu='/opt/musikcube_3.0.2_linux_x86/musikcube'
alias site='cd ~/Documents/chqn.jsx/'
alias suntar='sudo tar -xvzf'
alias blog='cd ~/Documents/chandlerjustice.com'
alias vimtex='nvim -c "set spell" -c "VimtexCompile"'
alias tt='tt -notheme'
alias nuwall='~/scripts/randomwall.sh'
set -o vi
fortune -s | cowsay

export GTK_THEME=Graphite-Dark

[[ -n "$_TUTR" ]] && source $_TUTR || true  # shell tutorial shim DO NOT MODIFY


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# NNN config
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'
