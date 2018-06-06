FROM ruby
ENV APP_ROOT /usr/src/ruby-vim
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT

RUN apt-get update

RUN \
  apt-get install -y bundler && \
  bundle install

RUN \
  apt-get install -y git

RUN \
  apt-get install -y vim && \
  apt-get upgrade -y vim && \
  apt-get install -y vim-nox && \
  apt-get install -y task-japanese locales-all && \
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && \
  sh ./installer.sh ~/.cache/dein

COPY .vimrc /root
CMD bash
