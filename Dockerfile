# the Docker image to be used
FROM node:8.11-alpine

# it will copy everything contained here (see the .) into /app (into the Docker container)
WORKDIR /app
COPY . /app

# you can run any command you want before starting the Docker container
#RUN sed ...

# you can set arguments
#ARG node_env=production

# and use them as environment variables
#ENV NODE_ENV ${node_env}

# that's the default command that will be launched into the image if no other commands are specified through the CLI
# the command itself IS the container
CMD ["node", "-v"]
