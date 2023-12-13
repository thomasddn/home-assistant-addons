#!/usr/bin/with-contenv bashio

export IS_HA_ADDON=1
CONFIG_PATH=/data/options.json
MQTT_HOST=$(bashio::config "MQTT_HOST")
#echo $(bashio::config "MQTT_HOST")

if [[ -z $MQTT_HOST || $MQTT_HOST = "null" ]]; then
    bashio::log.info "Retrieving MQTT settings from MQTT addon."
    export MQTT_HOST=$(bashio::services mqtt "host")
    export MQTT_PORT=$(bashio::services mqtt "port")
    export MQTT_USER=$(bashio::services mqtt "username")
    export MQTT_PWD=$(bashio::services mqtt "password")
else
    bashio::log.info "Retrieving MQTT settings from config."
    export MQTT_HOST
    export MQTT_PORT=$(bashio::config "MQTT_PORT")
    export MQTT_USER=$(bashio::config "MQTT_USER")
    export MQTT_PWD=$(bashio::config "MQTT_PWD")
fi

export BINARY_SENSORS=$(bashio::config "BINARY_SENSORS")
export CLIMATE_PRESETS=$(bashio::config "CLIMATE_PRESETS")
export CLIMATE_SENSORS=$(bashio::config "CLIMATE_SENSORS")
export QBUS_CAPTURE=$(bashio::config "QBUS_CAPTURE")
export LOG_LEVEL=$(bashio::config "LOG_LEVEL")

# echo $MQTT_HOST
# echo $MQTT_PORT
# echo $MQTT_USER
# echo $MQTT_PWD
# echo $LOG_LEVEL
# echo $QBUS_CAPTURE
# echo $CLIMATE_SENSORS
# echo $CLIMATE_PRESETS

python -u /app/main.py
