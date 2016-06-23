#! /bin/sh
alias cljrepl='~/launch-clojure-repl.sh'
alias cljdriprepl='~/launch-drip-clojure-repl.sh'
alias ga='git add'
alias gb='git branch'
alias gbd='git branch -d'
alias gc='git commit'
alias gcm='git commit -m'
alias gch='git checkout'
alias gchm='git checkout master'
alias gclr='git checkout -- .'
alias gdt='git difftool'
alias gl='git log'
alias glo='git log --oneline'
alias glog='git log --oneline --graph'
alias gloga='git log --oneline --graph --all'
alias gm='git merge'
alias gmt='git mergetool'
alias gp='git push'
alias gpt='git push origin --tags'
alias gpu='git pull'
alias grm='git rm'
alias grmr='git rm -r'
alias gs='git status'
alias gua='git reset HEAD --'
alias gchangedc='git diff-tree --no-commit-id --name-only -r'
alias gchanged='gchangedc HEAD'
alias gshow='git show' # Note, HEAD@{N} can be used to back trace head
alias gshow2='git diff HEAD^ HEAD' # Note, COMMIT^ COMMIT can be used for any commit's diff from it's predecesor
alias et='emacsclient -t'

alias reloadprof='source ~/.bash_profile'
alias soe='cd ~/github/haskell-soe'
alias excerpts='cd ~/github/excerpts'
alias blabber='cd ~/blabberize/repo/carbon-tiger'
alias h='cd ~'
alias cljexec='lein exec'

# Used to download template for use in scripting
# Usage: cljcli > [scriptname].clj
# Then run with cljexec [scriptname].cli [arg1] [arg2] ...
alias cljcli='curl -fsSL https://raw.githubusercontent.com/tomjkidd/excerpts/master/tools/clojure/cli-template.clj'

alias cljgroup='open -a Google\ Chrome http://groups.google.com/forum/\#\!forum/clojure'
alias elmgroup='open -a Google\ Chrome https://groups.google.com/forum/\#\!forum/elm-discuss'

PATH=$PATH:~/bin

# Use --new-window as an arg, default behavior is to open in current tab
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias chr='chrome'
alias chrcljs='chrome --new-window https://developer.mozilla.org/en-US/docs/Web/API http://cljs.info/cheatsheet/ http://localhost:8887/'
alias chrclj='chrome --new-window http://clojuredocs.org/'
alias chrelm='chrome http://package.elm-lang.org/packages/elm-lang/core/4.0.1/ http://package.elm-lang.org/'
alias chrnews='chrome --new-window https://news.ycombinator.com/ https://news.google.com/ http://groups.google.com/forum/\#\!forum/clojure https://groups.google.com/forum/\#\!forum/elm-discuss '

# Terminal colors
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
# alias ls='ls -GFh'
