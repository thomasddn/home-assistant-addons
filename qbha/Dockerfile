ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.12-alpine3.18
FROM $BUILD_FROM
ARG QBHA_VERSION=v0.8.1

# Keep Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turn off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Copy run.sh
COPY run.sh /
RUN chmod a+x /run.sh

# Setup app
RUN apk update && \
    apk upgrade && \
    apk add git && \
    git clone https://github.com/thomasddn/qbha /qbha && \
    cd /qbha && \
    git switch --detach $QBHA_VERSION && \
    mkdir /app && \
    mkdir /config && \
    cp /qbha/requirements.txt /app/requirements.txt && \
    python -m pip install -r /app/requirements.txt && \
    cp -R /qbha/src/. /app && \
    rm -rf /qbha

# Run
CMD [ "/run.sh" ]
