# simplest-docker-for-node
The simplest code to use a Docker container as a Node playground

## Note
A Docker image is the file system where the container (that's a process) runs.


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
