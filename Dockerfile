FROM matchoffice/rubies:2.3.3

# Install apt-utils and locales
RUN apt-get update -qq && apt-get install -qq -y apt-utils locales

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Add Elixir repos
RUN curl -sO https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb > /dev/null

# Installing node, erlang and elixir
RUN apt-get install -qq -y build-essential esl-erlang elixir > /dev/null

# Update hex
RUN mix local.hex --force
RUN mix local.rebar --force

