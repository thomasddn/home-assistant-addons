ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.12-alpine3.18
FROM $BUILD_FROM
ARG QBHA_VERSION=v0.1.0

# Keep Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turn off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Copy run.sh
COPY run.sh /

# Setup app
RUN apk update && \
    apk upgrade && \
    apk add git curl gcc && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    git clone https://github.com/thomasddn/qbha /qbha && \
    cd /qbha && \
    git switch --detach $QBHA_VERSION && \
    mkdir /app && \
    mkdir /data && \
    cp /qbha/requirements.txt /app/requirements.txt && \
    python -m pip install -r /app/requirements.txt && \
    cp -R /qbha/src/. /app && \
    rm -rf /qbha && \
    chmod a+x /run.sh

# Run
CMD [ "/run.sh" ]
