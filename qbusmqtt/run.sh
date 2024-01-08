#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

MQTT_HOST=$(bashio::config "MQTT_HOST")
# echo $(bashio::config "MQTT_HOST")

if [[ -z $MQTT_HOST || $MQTT_HOST = "null" ]]; then
    bashio::log.info "Retrieving MQTT settings from MQTT addon."
    MQTT_HOST=$(bashio::services mqtt "host")
    MQTT_PORT=$(bashio::services mqtt "port")
    MQTT_USER=$(bashio::services mqtt "username")
    MQTT_PWD=$(bashio::services mqtt "password")
else
    bashio::log.info "Retrieving MQTT settings from config."
    MQTT_PORT=$(bashio::config "MQTT_PORT")
    MQTT_USER=$(bashio::config "MQTT_USER")
    MQTT_PWD=$(bashio::config "MQTT_PWD")

    : "${MQTT_PORT:=1883}"
fi

# echo $MQTT_HOST
# echo $MQTT_PORT
# echo $MQTT_USER
# echo $MQTT_PWD

bashio::log.info "Starting Qbus MQTT gateway."
bashio::log.info "Connecting to MQTT broker '$MQTT_HOST:$MQTT_PORT' with user '$MQTT_USER'."
/usr/bin/qbus/qbusMqttGw -serial QBUSMQTTGW -logbuflevel -1 -logtostderr true -storagedir /opt/qbus -mqttbroker "tcp://$MQTT_HOST:$MQTT_PORT" -mqttuser "$MQTT_USER" -mqttpassword "$MQTT_PWD"
