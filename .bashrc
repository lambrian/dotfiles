alias ds='ssh devvm969.prn3.facebook.com'
alias blam='ssh blam@45.33.40.158'
alias sync_server_assets = 'rsync -rv --delete ~/Developer/brianlam.io/img blam@45.33.40.158:~/Developer/brianlam.io/'

export GOPATH=$HOME/Developer/go-workspace

export PATH=$PATH:$HOME/bin:$HOME/Developer/go-workspace/bin

source ~/.git-completion.bash
