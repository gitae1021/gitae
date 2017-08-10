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
alias lll='ls -alh'
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

export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\h:\[\e[31;1m\]\w:> \[\e[0m\]"

#location shortcuts

export PATH=/usr/local/texlive/2016/bin/x86_64-linux/":$PATH"
#Svnroots
export Home2=/media/arc-gt/a0e83a30-376a-453e-a853-97531be6b81d
export Svnroot=$Home2/svnroot
export Branch=$Svnroot/projects/typedarch/branches
export GTbranch=$Svnroot/projects/typedarch/branches/gitae
export SCD=$GTbranch/scd
export CN=$Svnroot/projects/typedarch/branches/channoh
export GEM5=$GTbranch/hw-dswp/gem5
# export GEM5=$GTbranch/hw-dswp/2nd-gem5
# export GEM5=$GTbranch/hw-dswp/3rd-gem5
# export GEM5=$GTbranch/dswp/gem5-15.04.15
# export GEM5=$GTbranch/dswp/gem5-14.12.14
# export Gem5=$Typedisa/gem5/src
export Papers=$Svnroot/papers
export trunks=$Svnroot/projects/typedarch/trunks
export Synthesis=$Svnroot/projects/typedarch/trunks/synthesis

function extract() {
    if [[ -f $1 ]]; then
        case $1 in 
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar e $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *.tar.xz)   tar xfJ $1     ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a vaild file"
    fi
}

function compress() {
    if [[ -e $2 ]]; then
        case $1 in 
            *.tar.bz2)  tar -jcvf $1 $2 ;;
            *.tar.gz)   tar -zcvf $1 $2 ;;
            *.zip)      zip -r $1 $2        ;;
            *)          echo "'$2' cannot be compressed via compress()" ;;
        esac
    else
        echo "'$1' is not a vaild file"
    fi
}

#Vivado
export PATH=/opt/Xilinx/Vivado/2015.2/bin:$PATH
export PATH=/opt/Xilinx/SDK/2015.2/bin:$PATH
export PATH=/opt/Xilinx/SDK/2015.2/gnu/arm/lin/bin:$PATH
export PATH=/home/arc-gt/Downloads/Xilinx_Vivado_SDK_Lin_2015.2_0612_1/tps/lnx64/jre/bin:$PATH 

#export PATH=/home/papl-gt/git/rocket-chip/fpga-zynq/common/linux-xlnx/scripts/dtc:$PATH && dtc -I dts -O dtb -o deliver_output/devicetree.dtb soft_config/zc706_devicetree.dts

#Rocket & Emulator & FPGA & Lua & JS
#CN
# export Rocket=$CN/typed/rocket-chip/rocket/src/main/scala #Typed-CN
# export Emulator=$CN/typed/rocket-chip/emulator
# export FPGA=$CN/typed/rocket-chip/fpga-zynq/zc706
# export Lua=$CN/typed/lua-5.3.0/src
# export JS=$CN/typed/mozjs17.0.0/js/src

#GT
# export Rocket=$GTbranch/rocket-chip-final/rocket/src/main/scala
# export Emulator=$GTbranch/rocket-chip-final/emulator
# export FPGA=$GTbranch/rocket-chip-final/fpga-zynq/zc706
# export Lua=$GTbranch/lua-5.3.0-typed/src
# export JS=$GTbranch/mozjs17.0.0-typed/js/src

#SCD
# export Rocket=$SCD/rocket-chip/rocket/src/main/scala 
# export Emulator=$SCD/rocket-chip/emulator
# export FPGA=$SCD/rocket-chip/fpga-zynq/zc706
# export Lua=$SCD/lua-5.3.0/src
# export JS=$SCD/mozjs17.0.0/js/src

#rocc
export Rocket=$GTbranch/rocket-chip-base/rocket/src/main/scala 
export Emulator=$GTbranch/rocket-chip-base/emulator
export FPGA=$GTbranch/rocket-chip-base/fpga-zynq/zc706
export Lua=$SCD/lua-5.3.0/src
export JS=$SCD/mozjs17.0.0/js/src

#RISCV
export PATH=$RISCV/bin:$PATH
export RISCV=$CN/typed/rocket-chip/riscv #unified Typedisa
# export RISCV=$CN/rocket-chip-typed4js/riscv #old js ver typedisa
# export RISCV=~/git/rocket/riscv #old lua ver typedisa
# export RISCV=$trunks/rocket-chip/riscv #trunk
# export RISCV=$CN/rocket-chip-checkedload4lua/riscv #Checked-load-lua
# export RISCV=$CN/rocket-chip-checkedload4js/riscv #Checked-load-js
# export RISCV=$Branch/asplos17/source/hw/rocket-chip-typed4lua/riscv #Checked-load-lua
# export RISCV=$GTbranch/rocket-chip-final/riscv #My branch rocket
# export RISCV=$SCD/rocket-chip/riscv #scd compiler
# export RISCV=$GTbranch/rocket-chip-base/riscv #rocc test compiler

#cross compiler
export PATH=~/ct-ng.comp:$PATH
export PATH=$GTbranch/crosstool-ng-1.23.0/.build/arm-unknown-linux-gnueabi/buildtools/bin:$PATH

#tmux
export TERM=xterm-256color
alias tmux="tmux -2"
alias tmux-open="tmux attach -t 0"

#basic alias
alias open='gnome-open' 
alias SVN="ssh gitae1021@147.46.219.120"

# alias dirdiff="vim -c DirDiff"/media/arc-gt/a0e83a30-376a-453e-a853-97531be6b81d/svnroot/projects/typedarch/branches/riscv/mozjs17.0.0/js/src/ /media/arc-gt/a0e83a30-376a-453e-a853-97531be6b81d/svnroot/projects/typedarch/branches/channoh/typed/mozjs17.0.0/js/src/""
#Synthesis alias
alias scp-synthesis="scp -P 2222 Top.DefaultVLSIConfig.v papl-s1@115.145.211.12:~"

#gem5 alias
alias gem5arm="$GEM5/build/ARM/gem5.opt $GEM5/configs/example/se.py" 
alias O3CPU="$GEM5/build/ARM/gem5.opt $GEM5/configs/example/se.py --cpu-type=DerivO3CPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8 "
alias MinorCPU="$GEM5/build/ARM/gem5.opt $GEM5/configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8 "

alias O3CPUdebug="$GEM5/build/ARM/gem5.debug $GEM5/configs/example/se.py --cpu-type=DerivO3CPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8"

alias O3CPUdebugflags="$GEM5/build/ARM/gem5.debug --debug-flags=ARCL,IQ $GEM5/configs/example/se.py --cpu-type=DerivO3CPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8"

# alias gem5papl="$GEM5/build/ALPHA/gem5.opt --debug-flags=Papl $GEM5/configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8"

