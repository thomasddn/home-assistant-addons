# QBHA

> [!WARNING]
> Qbus now has an [official integration](https://www.home-assistant.io/integrations/qbus) starting with Home Assistant 2025.2.0, which I helped develop. As new features continue to be added, **QBHA** will be phased out and eventually deprecated.
>
> However, the Qbus MQTT gateway, for which you can use the [qbusmqtt](../qbusmqtt/) add-on, is still required.

QBHA stands for Qbus Bridge for Home Assistant and can be pronounced as "cuba". QBHA will create MQTT topics for Home Assistant based on your Qbus configuration, making all supported entities available in Home Assistant.

It is also available as a Docker image: https://github.com/thomasddn/qbha.

![Supports amd64 Architecture][amd64-shield]
![Supports aarch64 Architecture][aarch64-shield]

## 🥤 Snack-fueled coding 

You know what goes great with open-source coding? Snacks! If my project helped you out, maybe throw a little something my way so my potato chips and Coca-Cola stash doesn't run out!

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/N4N7UZ6KN)

## 📦 Dependencies

This add-on requires MQTT and a Qbus MQTT gateway ([Docker](https://github.com/thomasddn/qbusmqtt) or [Home Assistant add-on](https://github.com/thomasddn/home-assistant-addons)).

## 🗣️ Remarks

This is **not** officially supported by Qbus.


[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg?style=flat-square
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg?style=flat-square
