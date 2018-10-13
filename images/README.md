# dive into image
A container image is a tar file containing tar files. Each of the tar file is a layer. Once all tar files have been extract into the same location then you have the container's filesystem.


## Try it out

```
 docker pull pythonrocks/chat-carbon:1.0.0
```

Export the image into the raw tar format.
```
 docker save  -o chat.tar pythonrocks/chat-carbon:1.0.0
 tar xvf chat.tar
```

The image also includes metadata about the image, such as version information and tag names. install `jq` if needed. 
```
cat repositories | jq . 
cat manifest.json | jq .
```

Extracting a layer will show you which files that layer provides.
```
tar xvf 2822671d0cf9e5ef8f60a47d2caac3446467387df22e240b23311a9a44c40721/layer.tar
```

Create an empty image
```
tar cv --files-from /dev/null | docker import - empty
docker images
```

## References

* [Digging into Docker layers](https://medium.com/@jessgreb01/digging-into-docker-layers-c22f948ed612)

* [About storage drivers](https://docs.docker.com/storage/storagedriver/)
