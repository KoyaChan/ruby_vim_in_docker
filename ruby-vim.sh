#!/bin/bash
cd ~/ruby_vim_in_docker
tmux new -s ruby-vim -d
tmux send-keys -t ruby-vim 'docker run --name RubyVim -it -v ~/scripts:/usr/src/scripts -v ~/ruby-vim-in-docker:/usr/src/ruby-vim -e TZ=Asia/Tokyo koyachan/ruby-vim' C-m
tmux split-window -v -t ruby-vim
sleep 2s
tmux send-keys -t ruby-vim 'docker exec -it RubyVim bash' C-m
tmux select-pane -t ruby-vim -U
tmux attach -t ruby-vim
docker container prune
