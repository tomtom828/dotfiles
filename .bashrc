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
HISTSIZE=1000
HISTFILESIZE=2000

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
alias la='ls -Al'
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

export NVM_DIR="/home/nate/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Borrowed from Local Dev
# Adds colors to LS
export CLICOLOR=1

# http://geoff.greer.fm/lscolors/
# Describes what color to use for which attribute (files, folders etc.)
export LSCOLORS=faexcxdxbxegedabagacad # PJ: turned off
# go back one directory
alias b='cd ..'
# If we make a change to our bash profile we need to reload it
alias reload="clear; source ~/.bashrc"
# Prefer US English
export LC_ALL="en_US.UTF-8"
# use UTF-8
export LANG="en_US"

# =================
# History
# =================
# History lists your previously entered commands
alias h='history'
# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups
# ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# Make some commands not show up in history
export HISTIGNORE="h:ls:ls *:ll:ll *:"

# =================
# Bash Prompt
# =================
# --------------------
# Colors for the prompt
# --------------------
# Set the TERM var to xterm-256color
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
      export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      # this is for xterm-256color
      BLACK=$(tput setaf 0)
      RED=$(tput setaf 1)
      GREEN=$(tput setaf 2)
      YELLOW=$(tput setaf 226)
      BLUE=$(tput setaf 4)
      MAGENTA=$(tput setaf 5)
      CYAN=$(tput setaf 6)
      WHITE=$(tput setaf 7)
      ORANGE=$(tput setaf 172)
      # GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      BG_BLACK=$(tput setab 0)
      BG_RED=$(tput setab 1)
      BG_GREEN=$(tput setab 2)
      BG_BLUE=$(tput setab 4)
      BG_MAGENTA=$(tput setab 5)
      BG_CYAN=$(tput setab 6)
      BG_YELLOW=$(tput setab 226)
      BG_ORANGE=$(tput setab 172)
      BG_WHITE=$(tput setab 7)
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
    UNDERLINE=$(tput sgr 0 1)
else
  BLACK="\[\e[0;30m\]"
  RED="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  YELLOW="\[\e[0;33m\]"
  CYAN="\[\e[0;36m\]"
  BLUE="\[\e[0;34m\]"
  BOLD=""
  RESET="\033[m"
fi

# ---------------------
# Print Stats on terminal load
# ---------------------
function welcome() {
  sed -i.bak s/welcome_prompt=false/welcome_prompt=true/g ~/.welcome_prompt
    echo "Message returned."
}

  # Show/Hide stats on terminal load
function unwelcome() {
  sed -i.bak s/welcome_prompt=true/welcome_prompt=false/g ~/.welcome_prompt
    echo "Message removed. Type ${BOLD}welcome${RESET} to return the message."
}

# ---------------------
# style the prompt
# ---------------------
style_user="\[${RESET}${WHITE}\]"
style_path="\[${RESET}${CYAN}\]"
style_chars="\[${RESET}${WHITE}\]"
style_branch="${RED}"
# ---------------------
# Build the prompt
# ---------------------
# Example with committed changes: username ~/documents/GA/wdi on master[+]
PS1="${style_user}\u"                    # Username
PS1+="${style_path} \w"                  # Working directory
PS1+="\$(prompt_git)"                   # Git details
PS1+="\n"                                # Newline
PS1+="${style_chars}\$ \[${RESET}\]"     # $ (and reset color)

function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
      # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
      # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}
# List any open internet sockets on port 3000. Useful if a rogue server is running
# http://www.akadia.com/services/lsof_intro.html
alias rogue='lsof -i TCP:3000'


export VISUAL=vim
export EDITOR="$VISUAL"

# -----------------
# For the prompt
# -----------------
# Long git to show + ? !
is_git_repo() {
  $(git rev-parse --is-inside-work-tree &> /dev/null)
}
is_git_dir() {
  $(git rev-parse --is-inside-git-dir 2> /dev/null)
}
get_git_branch() {
  local branch_name
# Get the short symbolic ref
  branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
# If HEAD isn't a symbolic ref, get the short SHA
  branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
# Otherwise, just give up
  branch_name="(unknown)"
  printf $branch_name
}

# Git status information
prompt_git() {
      local git_info git_state uc us ut st
      if ! is_git_repo || is_git_dir; then
        return 1
      fi
      git_info=$(get_git_branch)
      # Check for uncommitted changes in the index
      if ! $(git diff --quiet --ignore-submodules --cached); then
        uc="+"
      fi
      # Check for unstaged changes
      if ! $(git diff-files --quiet --ignore-submodules --); then
        us="!"
      fi
      # Check for untracked files
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        ut="${RED}?"
      fi
      # Check for stashed files
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        st="$"
      fi
      git_state=$uc$us$ut$st
      # Combine the branch name and state information
      if [[ $git_state ]]; then
        git_info="$git_info${RESET}[$git_state${RESET}]"
      fi
      printf "${WHITE} on ${style_branch}${git_info}"
}

# Git branch auto complete -- makes me happy
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# ========================
# Copy to global Clipboard
# ========================

set clipboard=unnamedplus
