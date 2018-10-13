# Docker repositories

## Docker Hub

Docker Hub repositories let you share images with co-workers, customers, or the Docker community at large. If you’re building your images internally, either on your own Docker daemon, or using your own Continuous integration services, you can push them to a Docker Hub repository that you add to your Docker Hub user or organization account.

Docker Hub uses your free Docker ID to save your account settings, and as your account namespace. If you don’t yet have a Docker ID, you can register for one.

You can search Docker Hub and pull images without an account and without signing in. However, to push images, leave comments, or to star a repository, you need to log in using a Docker ID.

## Prerequisites
Please register for a Docker ID. 

## tag and push the chat image
Please replace `pythorocks` with your own docker id. 
1. tag
```
docker tag chat-carbon:latest pythonrocks/chat-carbon:1.0.0
```
2. login and push
```
docker login -u pythonrocks
docker push pythonrocks/chat-carbon:1.0.0
```

## search 
```
$ docker search centos
NAME                               DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
centos                             The official build of CentOS.                   4744                [OK]
ansible/centos7-ansible            Ansible on Centos7                              118                                     [OK]
```