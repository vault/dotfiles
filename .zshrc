# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export GNOME_DESKTOP_SESSION_ID="FUCKXDGOPEN"

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="poem"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

source $ZSH/oh-my-zsh.sh
source /etc/profile.d/go.sh
export PATH=~/bin:/usr/local/bin:$PATH

# Customize to your needs...

#set up rvm
if [[ -s /home/michael/.rvm/scripts/rvm ]] ; then source /home/michael/.rvm/scripts/rvm ; fi


export EDITOR=vim
export TERM=xterm-256color
export PYTHONSTARTUP=/home/michael/.pythonrc

alias python=bpython
alias vi=vim
