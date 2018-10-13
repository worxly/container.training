# chat server

## Build and tag a chat server image
For a Dockerfile.
```
docker build -t chat-carbon:1.0.0 -f Dockerfile.carbon .
```

Check out the sizes of the images:
```shell
$ docker image ls
REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
chat-carbon                                1.0.0               15ffeec7f290        25 seconds ago      103MB
```

Check out the layers that comprise the chat image
```shell
$docker image history chat-carbon:1.0.0
IMAGE               CREATED              CREATED BY                                      SIZE                COMMENT
15ffeec7f290        About a minute ago   /bin/sh -c #(nop)  CMD ["npm" "start"]          0B
a5a2dc2602bb        8 minutes ago        /bin/sh -c #(nop)  EXPOSE 3000                  0B
a6307759f027        8 minutes ago        /bin/sh -c npm install --only=production        1.75MB
0f837712eb0b        8 minutes ago        /bin/sh -c #(nop) WORKDIR /app/examples/chat    0B
0de5b82476a5        8 minutes ago        /bin/sh -c npm install --only=production        11.2MB
83054dfe3056        8 minutes ago        /bin/sh -c #(nop) COPY dir:807cf83cd7b73b428…   24.1MB
adb54f08a144        8 minutes ago        /bin/sh -c #(nop) WORKDIR /app                  0B
df48b68da02a        4 weeks ago          /bin/sh -c #(nop)  CMD ["node"]                 0B
<missing>           4 weeks ago          /bin/sh -c apk add --no-cache --virtual .bui…   4.53MB
<missing>           4 weeks ago          /bin/sh -c #(nop)  ENV YARN_VERSION=1.9.4       0B
<missing>           4 weeks ago          /bin/sh -c addgroup -g 1000 node     && addu…   56.7MB
<missing>           4 weeks ago          /bin/sh -c #(nop)  ENV NODE_VERSION=8.12.0      0B
<missing>           4 weeks ago          /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
<missing>           4 weeks ago          /bin/sh -c #(nop) ADD file:25c10b1d1b41d46a1…   4.41MB


## Run the chat server
```
docker run -p 3000:30000 chat-carbon:latest
> socket.io-chat@0.0.0 start /app/examples/chat
> node index.js

Server listening at port 3000
```

Check the docker process 

```shell
$ docker container ls
CONTAINER ID        IMAGE                COMMAND             CREATED             STATUS              PORTS                               NAMES
9c53ce46b96d        chat-carbon:latest   "npm start"         3 seconds ago       Up 2 seconds        3000/tcp, 0.0.0.0:3000->30000/tcp   inspiring_noyce
```

Check the file size, please note the `virtual` below shows the image size.
```shell
$ docker ps -s
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES                                                                                  SIZE
8b6fffdbf470        05b2c3d28d84        "npm start"         18 hours ago        Up 18 hours                             k8s_chat-carbon_chat-8595bc48c5-k6rpr_default_184b122a-c062-11e8-8ad8-025000000001_0   55B (virtual 103MB)
```

### Let's chat
Go to http://localhost:3000/ in any browser

## JSON syntax vs string syntax
Let's check what if the image is built with the following string format in the Dockerfile instead of JSON format.  

```shell
CMD npm start
```
Then build an image from it. 

```shell
$docker build -t chat-carbon-shell:1.0.0 -f Dockerfile.carbon-shell .
$docker image history chat-carbon-shell:1.0.0
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
23694b6e5ff0        16 seconds ago      /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "npm …   0B
b9db19aa63f6        20 seconds ago      /bin/sh -c #(nop)  EXPOSE 3000                  0B
10783d7541b3        20 seconds ago      /bin/sh -c npm install --only=${env}            1.75MB
1fa71ed207f0        24 seconds ago      /bin/sh -c #(nop) WORKDIR /app/examples/chat    0B
236cc7bec467        25 seconds ago      /bin/sh -c npm install --only=${env}            11.2MB
d8c0df423136        38 seconds ago      /bin/sh -c #(nop)  ENV env=production           0B
83054dfe3056        17 minutes ago      /bin/sh -c #(nop) COPY dir:807cf83cd7b73b428…   24.1MB
adb54f08a144        17 minutes ago      /bin/sh -c #(nop) WORKDIR /app                  0B
df48b68da02a        4 weeks ago         /bin/sh -c #(nop)  CMD ["node"]                 0B
<missing>           4 weeks ago         /bin/sh -c apk add --no-cache --virtual .bui…   4.53MB
<missing>           4 weeks ago         /bin/sh -c #(nop)  ENV YARN_VERSION=1.9.4       0B
<missing>           4 weeks ago         /bin/sh -c addgroup -g 1000 node     && addu…   56.7MB
<missing>           4 weeks ago         /bin/sh -c #(nop)  ENV NODE_VERSION=8.12.0      0B
<missing>           4 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
<missing>           4 weeks ago         /bin/sh -c #(nop) ADD file:25c10b1d1b41d46a1…   4.41MB
```

Please note the `CMD npm start` (String format) is used instead of `CMD [ "npm", "start" ]` (JSON format).
There is an extra process `/bin/sh` invoked in string format and we can pass interpolates environment variables as a benefit. 



### Exercise 
Please build, tag and run a new image based on Dockerfile.heavy, comparing the size with the carbon image. 

### Further readings on Dockerfile
* [Building Docker images with a Dockerfile](https://github.com/jpetazzo/container.training/blob/master/slides/containers/Building_Images_With_Dockerfiles.md)
* [Tips for efficient Dockerfiles](https://github.com/jpetazzo/container.training/blob/master/slides/containers/Dockerfile_Tips.md)
* [Advanced Dockerfiles](https://github.com/jpetazzo/container.training/blob/master/slides/containers/Advanced_Dockerfiles.md)