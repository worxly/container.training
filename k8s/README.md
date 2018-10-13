# Deploy chat on Kubernetes cluster

[Docker for Mac with a local kubernetes cluster](https://docs.docker.com/docker-for-mac/kubernetes/) can be used for deploying the container

## Prerequisites
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Generate deployment manifest

```
kubectl create deployment chat --image=pythonrocks/chat-carbon:1.0.0 -o yaml --dry-run > deployment.yaml
```

## Create a deployment object
```
kubectl create -f deployment.yaml
```

## Expose the traffic to localhost
```
kubectl port-forward deployment/chat 3000:3000
```

Then going to http://localhost:3000/ in any browser
