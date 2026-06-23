FROM eclipse-temurin:17-jre-jammy   
# Java 17 JRE taban imajı

ARG JAR_FILE=target/*.jar           
# Kopyalanacak JAR (build-arg ile değiştirilebilir)

COPY ${JAR_FILE} app.jar            
# JAR'ı imaja app.jar adıyla ekle

EXPOSE 8080                         
# Uygulama portu

ENTRYPOINT ["java", "-jar", "app.jar"]  
# Konteyner başladığında uygulamayı çalıştır

