FROM elixir:latest

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force

# Install rebar package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.rebar --force

# Fetch the dependencies
RUN mix deps.get

# Compile the project
RUN mix do compile

# Use entrypoint script
CMD ["/app/entrypoint.sh"]