# Potentially destructive commands like rm, reset, restore, merge,
# rebase, mv and push do not have aliases to prevent accidents

# Also, I know that git has a native support for aliases, but I don't
# like having to type `git s` when I can just type `gs` and be done
# with it

alias gg="git log --graph --oneline --pretty=format:\"%C(yellow)%h %Cgreen%an %Cblue%ar %Cred%s%Creset %C(auto)%d%Creset\""
alias gl="git log --graph --stat"
alias gll="git log --graph --stat --no-abbrev-commit"
alias g-="git switch -"
alias g--="git switch"
alias gs="git status"
alias gsi="git status --ignored"
alias gf="git fetch && git status"
alias gdw="git diff --stat -p"
alias gd="git diff --stat -p --color-words"
alias gdcw="git diff --stat -p --cached"
alias gdc="git diff --stat -p --color-words --cached"
alias ga="git add"
alias gi="git add --interactive"
alias gri="git rebase -i"
alias gc="git commit -v"
alias gcae="git commit -v --amend"
alias gca="git commit -v --amend --no-edit"
alias gb="git branch -vv"
alias gba="git branch -vv --all"
alias gp="pre-commit run"
alias gpa="pre-commit run --all-files"
alias ghs="git stash push"
alias ghh="git stash show -p"
alias ghp="git stash pop"
alias ghl="git stash list"

export GPG_TTY=$TTY
