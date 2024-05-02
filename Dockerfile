FROM openjdk:11-jdk

LABEL maintainer="me@dungpb.com"

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs && \
    chmod +x cs && \
    echo "\n" | ./cs setup && \
    echo "export PATH=$PATH:/root/.local/share/coursier/bin" >> /root/.bashrc && \
    ./cs install bloop --only-prebuilt=true

CMD ["/bin/bash"]