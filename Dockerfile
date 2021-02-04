FROM elixir:1.11

RUN set -xe \
    && apt-get update \
    && apt-get install -y postgresql-client inotify-tools

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix archive.install hex phx_new 1.5.7
