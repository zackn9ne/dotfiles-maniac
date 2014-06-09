#  _               _                        __ _ _
# | |__   __ _ ___| |__    _ __  _ __ ___  / _(_) | ___
# | '_ \ / _` / __| '_ \  | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | (_| \__ \ | | | | |_) | | | (_) |  _| | |  __/
# |_.__/ \__,_|___/_| |_| | .__/|_|  \___/|_| |_|_|\___|
#                         |_|


# SYSTEM SETTINGS
##########################################################################

# ==================
# Path
# This is a list of all directories in which to look for commands, scripts and programs
# ==================
export PATH="/usr/local/bin:$PATH"
# NPM
PATH="/usr/local/share/npm/bin:$PATH"
# Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

# ====================
# File Navigation
# ====================
# LS lists information about files. -F includes a slash for directories.
alias ls='ls -la'
# Adds colors to LS
export CLICOLOR=1
# If we make a change to our bash profile we need to reload it
alias reload="clear; source ~/.bash_profile"
# Prefer US English
export LC_ALL="en_US.UTF-8"
# use UTF-8
export LANG="en_US"

# =================
# History
# =================
# History lists your previously entered commands
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
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
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
PS1+="\$(prompt_git)"                    # Git details
PS1+="\n"                                # Newline
PS1+="${style_chars}\$ \[${RESET}\]"     # $ (and reset color)

# =================
# Git
# =================
# -----------------
# Aliases
# -----------------
# Alias for hub http://hub.github.com/
# alias git='hub'
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

# =================
# Rails
# =================
# Migrate Dev and Test databases and annotate models
# alias migrate='rake db:migrate; rake db:migrate RAILS_ENV=test; annotate'

# =================
# rbenv
# =================
# start rbenv (our Ruby environment and version manager) on open
eval "$(rbenv init -)"

# Other Settings
##########################################################################

# =================
# Shortcuts
# =================
# Students can add a shortcut to quickly access their GA folder
# example: alias wdi="cd ~/Documents/GA/WDI4"
# TODO: Set these
alias wdi="cd ~/code/wdi/"

 cdhwfunc() {
   # takes three args: the week, the day
   # and an optional third for the user
   if [ $1 -lt 10 ]
   then
     cd ~/code/wdi/$class_repo/w0$1/d0$2/${3:-Instructor}
   else
     cd ~/code/wdi/$class_repo/w$1/d0$2/${3:-Instructor}
   fi
 }
 alias cdhw=cdhwfunc

# =================
# Source Files
# =================
# .bash_settings and .bash_prompt should be added to .gitignore_global
# An extra file where you can create other settings, such as your
# application usernames or API keys...
if [ -f ~/.bash_settings ]; then
  source ~/.bash_settings
fi
# An extra file where you can create other settings for your prompt.
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi
# A welcome prompt with stats for sanity checks
if [ -f ~/.welcome_prompt ]; then
  source ~/.welcome_prompt
fi

# Below here is an area for other commands added by outside programs or
# commands. Attempt to reserve this area for their use!
##########################################################################

# ====================================
# Environmental Variables and API Keys
# ====================================
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"


# Loads Powerline
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH


# powerline needs this to run in other apps
if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

# zacks current class script
myfunction() {
	cd ~/code/wdi/WDI_NYC_Apr14_String/w0$1/d0$2/Zack_Levine
	}
alias wdc=myfunction

# alias to open notes & todo
alias notes='vi ~/notes.txt'
alias todo='vi ~/todo.txt'
