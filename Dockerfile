FROM matchoffice/rubies:2.3.1

# Setting output to non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Install apt-utils
RUN apt-get update -qq && apt-get install -qq -y apt-utils

# Add Elixir repos
RUN curl -sO https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb > /dev/null

# Add Node repo
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - > /dev/null

# Installing node, erlang and elixir
RUN apt-get install -qq -y build-essential nodejs esl-erlang elixir > /dev/null

# Update hex
RUN mix local.hex --force
RUN mix local.rebar --force

