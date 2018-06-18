FROM ruby
ENV APP_ROOT /usr/src/scripts
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

# setup python3
ENV PYTHON /usr/bin/python3
RUN \
  apt-get upgrade -y python3 && \
  apt-get install -y python3-pip && \
  apt-get install -y python3-matplotlib && \
  pip3 install numpy && \
  pip3 install pandas
# -----

COPY .vimrc /root
COPY .pryrc /root
CMD bash
