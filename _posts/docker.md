---
title: "Docker"
image:
  path: /assets/img/logo_docker.png
...

## About

> Docker is a tool that is used to automate the deployment of applications in 
> lightweight containers so that applications can work efficiently in different 
> environments in isolation.

Source: [Wikipedia](https://en.wikipedia.org/wiki/Docker_(software))

## Useful commands

> All commands should be run in root mode
{: .prompt-info }

> Note: A Docker image creates containers to run on the Docker platform.

| Description                 | Command                                  |
| --------------------------- | ---------------------------------------- |
| Install dockerfile          | `docker build -t IMAGE_NAME .`           |
| List images                 | `docker images`                          |
| Run image with bash         | `docker run -i -t IMAGE_ID /bin/bash`    |
| Copy from host to container | `docker cp PATH1 DOCKER_CONTAINER:PATH2` |
| Copy from container to host | `docker cp DOCKER_CONTAINER:PATH2 PATH1` |
| Remove all containers       | `docker rm -v -f $(docker ps -qa)`       |
| Container creation          | `docker create --name CNT_NAME IMG_NAME` |
| Container start             | `docker start CNT_NAME`                  |

- `CMD` is a command that will be executed once the container is run
- `ENTRYPOINT` is the list arguments passed to CMD


## Docker Installation

```bash
# Uninstall conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 \
  podman-docker containerd runc; 
do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify that docker installation is successful
sudo docker run hello-world
```

Source: [here](https://docs.docker.com/engine/install/ubuntu/)

## Dockerfile example

Dockerfile example of full latex installation:

```dockerfile
FROM ubuntu:xenial
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && apt-get install -qy \
    texlive-full \
    python-pygments gnuplot \
    make git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
```

