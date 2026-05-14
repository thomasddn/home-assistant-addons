FROM ghcr.io/home-assistant/base-debian:trixie
ARG TARGETARCH
ARG QBUSMQTT_VERSION=v0.6.0

# Install requirements
RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install libc6 libdbus-1-3 libstdc++6 -y && \
    apt-get install tftp-hpa git unzip arp-scan net-tools telnet -y

# Copy run.sh
COPY run.sh /
RUN chmod a+x /run.sh

# Setup app
RUN case "${TARGETARCH:-amd64}" in \
        amd64) ARCH_MAP="x64" ;; \
        arm64) ARCH_MAP="arm64" ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}" && exit 1 ;; \
        esac && \
    git clone https://github.com/thomasddn/qbusmqtt /qbusmqtt && \
    cd /qbusmqtt && \
    git switch --detach $QBUSMQTT_VERSION && \
    cd / && \
    mkdir -p /opt/qbusmqttgw && \
    mkdir -p /var/log/qbusmqttgw && \
    chmod a+r /var/log/qbusmqttgw && \
    cp /qbusmqtt/binaries/gateway-${ARCH_MAP}/qbusMqttGw /opt/qbusmqttgw/ && \
    cp -R /qbusmqtt/binaries/fw/ /opt/qbusmqttgw/ && \
    cp /qbusmqtt/binaries/puttftp /opt/qbusmqttgw/ && \
    chmod +x /opt/qbusmqttgw/qbusMqttGw && \
    chmod +x /opt/qbusmqttgw/puttftp && \
    rm -rf /qbusmqtt

# Run
CMD [ "/run.sh" ]
