########################################X########################################
#				  G L O B A L S					#
# directories									#
PATH_BASH=$HOME"/project_bash/"							#
PATH_PY=$HOME"/project_py/"							#
# files										#
this=$HOME"/.bash_aliases"							#
#										#
########################################X########################################
#				  A L I A S E S 				#
# cd										#
alias go2="less "$this" | grep go2"						#
alias go2ba="cd "$PATH_BASH							#
alias go2py="cd "$PATH_PY							#
# git										#
alias cgd="clear && git status && git diff"					#
alias cgs="clear && git status && git stash list"				#
alias gca="git config --list --show-origin"					#
alias gcga="git config --global --list --show-origin"				#
alias gadog="git log --all --decorate --oneline --graph"			#
alias gfsb="clear && git fetch && git status && git branch -va"			#
# ls										#
alias clh="clear && ls -hl"							#
alias laa="ls -hal"								#
alias lhl="ls -hl"								#
# python									#
alias venvact="source venv/bin/activate"					#
# system									#
alias c="clear"									#
alias f="nemo ."								#
alias e="exit"									#
alias sreboot="systemctl reboot -i"						#
# vim										#
alias forgot="less "$this							#
alias lazy="vim "$this								#
#				  A L I A S E S 				#
########################################X########################################
#                 A U T O R U N  O N  N E W  T E R M I N A L			#
# terminal launch script							#
echo "this terminal opened on "$(date)						#
########################################X########################################

