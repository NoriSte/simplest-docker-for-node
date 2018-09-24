# simplest-docker-for-node
The simplest code to use a Docker container as a Node playground

## Note
A Docker image is the file system where the container (that's a process) runs.

Consider this basic `Dockerfile` file
```docker
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

```


# Commands
The most useful commands are:

## Create the Docker image
It will use the Dockerfile
```bash
# docker build --tag TAG .
docker build --tag node_8:node8alpine .
```
and if you want to re-run the initialization commands in the Dockerfile you must launch the command again.

## Run the Docker container
```bash
# docker run -it --name CONTAINER_NAME TAG
# -it stands for "interactive terminal"
docker run -it --name node_8 node_8:node8alpine
```
the standard container (process) wrote in the Dockerfile will be launched.

## Run a custom container (not the one provided into the Dockerfile)
```bash
# docker run -it --name CONTAINER_NAME TAG CUSTOM_CONTAINER
# eg. to run a pristine shell inside the image
docker run -it --name node_8 node_8:node8alpine sh
# eg. other commands
docker run -it --name node_8 node_8:node8alpine node -v
```

### Stop/remove a container
If Docker tells you that a container with the same name is already running
```bash
# docker stop CONTAINER_NAME
docker stop node_8
```
```bash
# docker rm CONTAINER_NAME
docker rm node_8
```

# Additional commands/options

### Set the port
```bash
docker run -it --name node_8 -p 8001:8001 node_8:node8alpine
```

### Set the NODE_ENV
```bash
docker run -it --name node_8 -e NODE_ENV=production node_8:node8alpine
```

### Link a Docker image from another one
```bash
# --link ANOTHER_CONTAINER_NAME
docker run -it --name express_url -p 8002:8002 node_8:node8alpine
docker run -it --name node_8 node_8:node8alpine --link express_url
```
A link to the second container (express_url in the example) will be added to the `hosts` file of the launching container (node_8 in the example). So any call requested by the node_8 container to http://express_url:8002 will be redirected to the express_url container
