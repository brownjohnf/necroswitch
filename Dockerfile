FROM        library/ruby:2.3.0

WORKDIR     /src
CMD         bundle exec rails s -p 3000 -b 0.0.0.0
ENV         WEB_ROOT /src

COPY        Gemfile       Gemfile
COPY        Gemfile.lock  Gemfile.lock

RUN         bundle config build.nokogiri --use-system-libraries && \
            bundle -j 4

COPY        . $WEB_ROOT/.

