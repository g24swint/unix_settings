git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export PS1="\u@\h:\[\e[36;1m\]\w\[\e[0m\]\$(git_branch)\$ "
export PS1="\e[1;32m\u\e[0m@\h:\[\e[36;1m\]\w\[\e[0m\]$(git_branch)$ "

