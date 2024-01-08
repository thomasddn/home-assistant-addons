ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-ubuntu:20.04

FROM $BUILD_FROM
ARG TARGETARCH
ARG QBUSMQTT_VERSION=v0.2.0

# Copy run.sh
COPY run.sh /
RUN chmod a+x /run.sh

# Setup app
RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install libc6 libdbus-1-3 libstdc++6 -y && \
    apt-get install tftp git unzip arp-scan net-tools telnet -y && \
    git clone https://github.com/thomasddn/qbusmqtt /qbusmqtt && \
    cd /qbusmqtt && \
    git switch --detach $QBUSMQTT_VERSION && \
    cd /qbusmqtt/binaries/qbusMqttGw && \
    tar -xf qbusMqttGw-${TARGETARCH}.tar && \
    cd / && \
    mkdir /usr/bin/qbus && \
    mkdir /opt/qbus && \
    cp -R /qbusmqtt/binaries/fw/ /opt/qbus/ && \
    cp /qbusmqtt/binaries/puttftp /opt/qbus/ && \
    cp /qbusmqtt/binaries/qbusMqttGw/qbusMqttGw /usr/bin/qbus/ && \
    chmod +x /usr/bin/qbus/qbusMqttGw && \
    chmod +x /opt/qbus/puttftp && \
    rm -rf /qbusmqtt

# Run
CMD [ "/run.sh" ]
