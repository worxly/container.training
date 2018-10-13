# container.training
Slides and code samples for training, tutorials about containers. 

## Target Audience
The target audience for this tutorial is someone learning containers.

## Slides
[Docker slides](https://www.slideshare.net/pythonrocks/clipboards/docker-intro)

## Containers are superior
Containers are superior to conventional deployment mechanism in that they are:
1. Isolated:
  - Applications have their own libraries, no conflicts will arise from
  different libraries in other applications. Docker uses a technology called namespaces to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.

2. Limited (can set limits on CPU/memory):
  - Applications may not hog resources from other applications.Docker Engine on Linux also relies on another technology called control groups (cgroups). A cgroup limits an application to a specific set of resources. Control groups allow Docker Engine to share available hardware resources to containers and optionally enforce limits and constraints. 
3. Portable:
  - Container contains everything it needs, not tied to an OS or Cloud.
4. Lightweight:
  - The kernel is shared making it much smaller and faster than a full OS image.

## Install Docker
* [on Mac](https://docs.docker.com/docker-for-mac/install/)
* [on Windows](https://docs.docker.com/docker-for-windows/install/)
* [on Linux](https://docs.docker.com/install/), instructions depends on the linux distribution.


## Labs

* [Build, tag and run a chat server in docker](chat/README.md)
* [Push the chat server image to DockerHub](registry/README.md)
* [Deploy the chat container on a local kubernetes](k8s/README.md)
* [Dive into the images](images/README.md)


## For fun

`docker run -it --rm jess/hollywood`

* [Dockerfile](https://github.com/jessfraz/dockerfiles/blob/master/hollywood/Dockerfile)
* [Hollywood](https://github.com/dustinkirkland/hollywood)