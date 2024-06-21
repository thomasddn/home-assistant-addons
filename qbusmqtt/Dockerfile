ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-debian:bookworm

FROM $BUILD_FROM
ARG TARGETARCH
ARG QBUSMQTT_VERSION=v0.3.0

# Install requirements
RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install libc6 libdbus-1-3 libstdc++6 -y && \
    apt-get install tftp git unzip arp-scan net-tools telnet -y

# Copy run.sh
COPY run.sh /
RUN chmod a+x /run.sh

# Setup app
RUN case "${TARGETARCH:-amd64}" in \
        arm|armv7|armhf) ARCH_MAP="arm" ;; \
        arm64|aarch64) ARCH_MAP="arm64" ;; \
        amd64) ARCH_MAP="x64" ;; \
        386|i386) ARCH_MAP="x86" ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}" && exit 1 ;; \
        esac && \
    git clone https://github.com/thomasddn/qbusmqtt /qbusmqtt && \
    cd /qbusmqtt && \
    git switch --detach $QBUSMQTT_VERSION && \
    cd / && \
    mkdir -p /opt/ubielite && \
    mkdir -p /var/log/ubielite && \
    chmod a+r /var/log/ubielite && \
    cp /qbusmqtt/binaries/UbieLite-${ARCH_MAP}/UbieLite /opt/ubielite/ && \
    cp -R /qbusmqtt/binaries/fw/ /opt/ubielite/ && \
    cp /qbusmqtt/binaries/puttftp /opt/ubielite/ && \
    chmod +x /opt/ubielite/UbieLite && \
    chmod +x /opt/ubielite/puttftp && \
    rm -rf /qbusmqtt

# Run
CMD [ "/run.sh" ]
