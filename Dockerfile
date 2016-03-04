FROM        library/ruby:2.3.0

WORKDIR     /src
CMD         bundle exec rails s
ENV         WEB_ROOT /src

COPY        Gemfile       Gemfile
COPY        Gemfile.lock  Gemfile.lock

RUN         bundle -j 4

COPY        . $WEB_ROOT/.

