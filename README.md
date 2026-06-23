# devops-01-docker-hello

Spring Boot tabanlı basit bir uygulamanın Docker imajına paketlenmesini gösteren demo projesidir. Amaç, JAR dosyasını oluşturup `Dockerfile` ile konteyner haline getirmektir.

## Proje Bilgileri

| Özellik        | Değer                          |
|----------------|--------------------------------|
| Dil            | Java 17                        |
| Framework      | Spring Boot 4.0.6              |
| Build aracı    | Maven                          |
| Uygulama portu | 8080                           |
| JAR çıktısı    | `target/devops-01-docker-hello-1.0.7.jar` |

## CI/CD Evreni

```
CI/CD:           (Jenkins, Git, GitHub, GitOps, GitHub Actions, GitLab, GitLab CI, Bitbucket, Bamboo)
Scripting:       (Python, Bash, PowerShell)
Containers:      (Docker)
Orchestration:   (Kubernetes, Helm, ArgoCD)
Cloud:           (AWS, Azure, GCP)
Virtualization:  (VMware, VirtualBox)
IaC:             (Terraform, Ansible, CloudFormation)
Monitoring:      (Prometheus, Grafana, ELK)
```

---

## Gereksinimler

- JDK 17
- Maven (veya projedeki `mvnw` / `mvnw.cmd` wrapper)
- Docker Desktop veya Docker Engine

---

## Yerel Geliştirme

Önce uygulamayı derleyip JAR dosyasını oluşturun:

```bash
./mvnw clean package
```

Windows PowerShell:

```powershell
.\mvnw.cmd clean package
```

Derleme başarılı olduğunda `target/` klasöründe `devops-01-docker-hello-1.0.7.jar` dosyası oluşur.

Uygulamayı doğrudan çalıştırmak için:

```bash
java -jar target/devops-01-docker-hello-1.0.7.jar
```

Uygulama `http://localhost:8080` adresinde ayağa kalkar.

---

## Docker ile Çalıştırma

### 1. Docker Hub'a giriş

Terminalden aşağıdaki komutlardan biriyle giriş yapın:

```bash
docker login -u DOCKER_KULLANICIADI -p DOCKER_PAROLA
```

```bash
docker login --username mimaraslan --password 123456789
```

```bash
docker login -u mimaraslan --password 123456789
```

```bash
docker login --username mimaraslan -p 123456789
```

> **Not:** Şifreyi komut satırında yazmak güvenli değildir. Gerçek ortamlarda `docker login` komutunu şifresiz çalıştırıp etkileşimli giriş yapın veya bir secret yöneticisi kullanın.

### 2. Docker imajı oluşturma

`Dockerfile`, `eclipse-temurin:17-jre-jammy` taban imajını kullanır ve JAR dosyasını `app.jar` olarak kopyalar. İmajı oluşturmak için önce Maven ile derleme yapılmış olmalıdır.

```bash
docker build --build-arg JAR_FILE=target/devops-01-docker-hello-1.0.1.jar --tag mimaraslan/devops-01-docker-hello:v001 .
```

`--build-arg JAR_FILE` parametresi, hangi JAR dosyasının imaja kopyalanacağını belirtir. Bu değer verilmezse `Dockerfile` içindeki varsayılan `target/*.jar` kullanılır.

### 3. Konteyneri çalıştırma

```bash
docker run --rm -p 8080:8080 mimaraslan/devops-01-docker-hello:v001
```

Tarayıcıdan veya terminalden kontrol:

```bash
curl http://localhost:8080
```

### 4. İmajı Docker Hub'a gönderme (isteğe bağlı)

```bash
docker push mimaraslan/devops-01-docker-hello:v001
```

---

## Dockerfile Özeti

```dockerfile
FROM eclipse-temurin:17-jre-jammy   # Java 17 JRE taban imajı
ARG JAR_FILE=target/*.jar           # Kopyalanacak JAR (build-arg ile değiştirilebilir)
COPY ${JAR_FILE} app.jar            # JAR'ı imaja app.jar adıyla ekle
EXPOSE 8080                         # Uygulama portu
ENTRYPOINT ["java", "-jar", "app.jar"]  # Konteyner başladığında uygulamayı çalıştır
```

---

## Proje Yapısı

```
devops-01-docker-hello/
├── Dockerfile
├── pom.xml
├── mvnw / mvnw.cmd
└── src/
    ├── main/
    │   ├── java/com/mimaraslan/Devops01DockerHelloApplication.java
    │   └── resources/application.properties
    └── test/
```
