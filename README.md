# DevOps

### Docker Demo

Dockerfile demo projesi

```
docker login -u           mimaraslan    -p          123456789

docker login --username   mimaraslan    --password  123456789

docker login -u           mimaraslan    --password  123456789
```


```
docker build   --build-arg   JAR_FILE=target/devops-01-docker-hello-0.0.1-SNAPSHOT.jar    --tag mimaraslan/devops-01-docker-hello:v001  .
```
