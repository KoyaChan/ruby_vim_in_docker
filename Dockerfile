FROM ruby
ENV APP_ROOT /usr/src/ruby-vim
WORKDIR $APP_ROOT

RUN \
  apt-get update && \
  apt-get install -y vim && \
  apt upgrade -y vim && \
  apt install -y vim-nox && \
  apt install -y task-japanese locales-all && \
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && \
  sh ./installer.sh ~/.cache/dein

COPY .vimrc /root
