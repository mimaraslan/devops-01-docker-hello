# DevOps Pipeline

## CI/CD Evreni

```

CI/CD:           (Jenkins, Git,  GitHub, GitOps,  GitHub Actions,    GitLab, GitLab CI,    Bitbucket, Bamboo)
Scripting        (Python, Bash, PowerShell)
Containers:      (Docker)
Orchestration:   (Kubernetes, Helm, ArgoCD)
Cloud            (AWS, Azure, GCP)
Virtualization:  (VMware, VirtualBox)
IaC:             (Terraform, Ansible, CloudFormation)
Monitoring:      (Prometheus, Grafana, ELK)
```
---

### Dockerfile demo projesi

Termimalden aşağıdaki komutlardan biriyle login olacağız.
```
docker login -u           mimaraslan    -p          123456789
```

```
docker login --username   mimaraslan    --password  123456789
```

```
docker login -u           mimaraslan    --password  123456789
```

```
docker login --username   mimaraslan    -p  123456789
```


### Docker build yapıp localde image oluşturacağız.


## MAVEN

```
docker build   --build-arg   JAR_FILE=target/devops-01-docker-hello-0.0.1-SNAPSHOT.jar   --tag mimaraslan/devops-01-docker-hello:v001 .

```

## GRADLE

```
docker build  --build-arg   JAR_FILE=build/libs/devops-01-docker-hello-0.0.1-SNAPSHOT.jar   --tag mimaraslan/devops-01-docker-hello:v001 .

```