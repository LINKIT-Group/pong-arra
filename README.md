# pong-arra

building an image
```
docker build --build-arg version=v1 -t linkitgroup/pong-arra:v1 . 
```

running an image
```
docker run -p 8080:8080 linkitgroup/pong-arra:v1
```

publishing an image
```
docker push linkitgroup/pong-arra:v1
```