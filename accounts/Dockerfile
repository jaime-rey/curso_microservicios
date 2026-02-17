# Start with base image containing Java RT
FROM openjdk:27-ea-slim

# Information about who is in charge
LABEL org.opencontainers.image.authors="jaimereycasado@gmail.com"

# Add the app´s jar to the image
COPY target/accounts-0.0.1-SNAPSHOT.jar accounts-0.0.1-SNAPSHOT.jar

# Execute the app
ENTRYPOINT ["java", "-jar", "accounts-0.0.1-SNAPSHOT.jar"]