# FROM maven:3.9.4-amazoncorretto-17-debian

# WORKDIR /usr/src/app

# COPY . /usr/src/app
# RUN mvn package

# ENV PORT 5000
# EXPOSE $PORT
# CMD [ "sh", "-c", "mvn -Dserver.port=${PORT} spring-boot:run" ]
FROM vuln/testdocker
RUN apt-get update && \
    apt-get install -y wget curl && \
    rm -rf /var/lib/apt/lists/*
RUN random_string=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 16); echo $random_string > out.file
CMD ["bash", "-c", "echo '🚨 Vulnerable + outdated packages installed' && sleep infinity"]
