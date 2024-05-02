FROM openjdk:11-jdk

# Install curl and other dependencies
RUN apt-get update && apt-get install -y curl

# Download and install Coursier
RUN curl -fL https://github.com/VirtusLab/coursier-m1/releases/latest/download/cs-aarch64-apple-darwin.gz | gzip -d > cs && \
    chmod +x cs && \
    ./cs setup

# Set up Coursier, sbt, and pre-built Bloop using Coursier
RUN ./cs setup --yes && \
    ./cs setup install sbt && \
    ./cs install bloop --only-prebuilt=true
