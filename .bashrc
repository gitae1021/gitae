# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#export RISCV=/opt/riscv
#export PATH=$PATH:/opt/riscv/bin 
export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\h:\[\e[31;1m\]\w:> \[\e[0m\]"

#location shortcuts

#git
export Rocket=$HOME/git/rocket-chip/rocket/src/main/scala
export Emulator=$HOME/git/rocket-chip/emulator
export FPGA=$HOME/git/rocket-chip/fpga-zynq/zc706

#Svnroots
export Svnroot=$HOME/svnroot
export Branch=$Svnroot/projects/typedarch/branches/gitae
export Typedisa=$Svnroot/projects/typedarch/branches/gitae/typedisa
export Gem5=$Typedisa/gem5/src/
export Papers=$Svnroot/papers/asplos16_typed

#RISCV & Vivado

export RISCV=/home/papl-gt/git/rocket-chip/riscv
export PATH=$PATH:$RISCV/bin
#export PATH=/home/papl-gt/git/rocket/riscv/bin:$PATH
#export PATH=$PATH:/home/papl-gt/svnroot/projects/typedarch/branches/gitae/typedisa/compilers/alphaev67-unknown-linux-gnu/bin
export GEM5=/home/papl-gt/svnroot/projects/typedarch/branches/gitae/typedisa/gem5


export PATH=/opt/Xilinx/Vivado/2015.2/bin:$PATH
export PATH=/opt/Xilinx/SDK/2015.2/bin:$PATH
export PATH=/opt/Xilinx/SDK/2015.2/gnu/arm/lin/bin:$PATH
export PATH=/home/papl-gt/Downloads/Xilinx_Vivado_SDK_Lin_2015.2_0612_1/tps/lnx64/jre/bin:$PATH 
#export PATH=/home/papl-gt/git/rocket-chip/fpga-zynq/common/linux-xlnx/scripts/dtc:$PATH && dtc -I dts -O dtb -o deliver_output/devicetree.dtb soft_config/zc706_devicetree.dts

alias gem5alpha="$GEM5/build/ALPHA/gem5.opt $GEM5/configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8"

alias gem5debug="$GEM5/build/ALPHA/gem5.opt --debug-flags=Exec,IntRegs,TagRegs $GEM5/configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8"

alias gem5papl="$GEM5/build/ALPHA/gem5.opt --debug-flags=Papl $GEM5/configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8"

alias open='gnome-open' 

alias scp-fpga="scp test_1 root@115.145.211.112:/home/root/sdcard"
alias fpga="ssh root@115.145.211.112"
alias emulator="./emulator-Top-DefaultCPPConfig +dramsim2_ini +verbose pk /home/papl-gt/svnroot/projects/typedarch/branches/gitae/icmiss_test/test_1 2> test.log"
