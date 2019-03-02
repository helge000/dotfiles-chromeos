# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
cd ~
export PAGER='less'
export PATH="$HOME/go/bin:$PATH"
export TMPDIR=/usr/local/tmp
export VISUAL=vim
export EDITOR="$VISUAL"
export LC_TIME=de_DE.utf8

# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html.
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share
export XDG_CONFIG_DIRS=/usr/local/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache
export GOPATH=~/code/go
export PATH=$GOPATH/bin:$PATH


# poerted aliases
alias gitcompu='git commit && git push'
alias muster='kstart ~/Applicatios/Muster6.2.0.x64.linux/xConsole'
alias puppet-parse='find . -type f -name "*.pp" -exec echo File: {} \; -exec puppet parser validate {} \;'
alias gitlog='git log --graph --oneline --decorate --all'
alias gitrebase='git fetch --all && git rebase'
alias gitpuppetmerge='git checkout production && git merge development && git push && git checkout development && git push'
alias gitprpush='git commit --amend --no-edit && git push -f'
alias subl=sublime_text

rm_knownh() {
  [[ $1 =~ ^[0-9]+ ]] && sed -i.sedbkp "${1}d" ~/.ssh/known_hosts && echo "Removed line '$1' from known hosts"
}
alias rm-known-host=rm_knownh

# Sommelier environment variables + daemon
# See https://github.com/dnschneid/crouton/wiki/Sommelier-(A-more-native-alternative-to-xiwi)
if [ ! -d /tmp/.X11-unix ]; then
	mkdir /tmp/.X11-unix
	sudo chmod -R 1777 /tmp/.X11-unix
        sudo chown root:root /tmp/.X11-unix
fi
alias startsommelier="set -a && source ~/.sommelier.env && set +a && initsommelier"
startsommelier

# bash completion
[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion ]] && \
  source /usr/local/share/bash-completion/bash_completion

# nodebrew completion
if [ -f /usr/local/share/nodebrew/completions/bash/nodebrew-completion ]; then
  source /usr/local/share/nodebrew/completions/bash/nodebrew-completion
fi

# nodebrew completion
if [ -f /usr/local/share/nodebrew/completions/bash/nodebrew-completion ]; then
  source /usr/local/share/nodebrew/completions/bash/nodebrew-completion
fi

# SSH - Agent, no gpg yet
eval $(ssh-agent -s)
if [ -z "$(ssh-add -l|grep '/home/chronos/user/.ssh/id_rsa')" ]; then ssh-add; fi

