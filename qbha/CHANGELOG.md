# Changelog

## 0.8.1 - 2024-12-05

### Added

- Support for tilting covers (thomasddn/qbha#10)


## 0.8.0 - 2024-09-29

### Added

- Add support for ventilation CO2 sensor (thomasddn/qbha#9)
- Make boot order with qbusmqtt irrelevant


## 0.7.3 - 2024-08-30

### Fixed

- Unsupported variant value type in Qbus configuration (thomasddn/qbha#6)


## 0.7.2 - 2024-06-28

### Added

- Support for volume storage (thomasddn/qbha#7 by @mathiasbl)


## 0.7.1 - 2024-06-08

### Fixed

- Unsupported variant value type in Qbus configuration (thomasddn/qbha#6)


## 0.7.0 - 2024-06-07

### Added

- Added support for Luqas and gauges of variant Power, Energy, Current, Voltage. Gauges with unit 'kWh' are considered to be totals. (thomasddn/qbha#5 by @mathiasbl)


## 0.6.0 - 2024-01-12

### Added

- Support for multiple controllers


## 0.5.0 - 2023-12-13

### Added

- Option to create binary sensors for certain switch entities (thomasddn/qbha#3)
- Informational attributes


## 0.4.0 - 2023-11-21

### Added

- Option to create sensors for climate entities (thomasddn/qbha#2)
- Option to define which climate presets to make available in HA

### Changed

- Make use of the `addon_configs` folder when running as HA add-on


## 0.3.0 - 2023-11-10

### Added

- Throttle thermostat updates

### Changed

- Add hostname as part of the MQTT client id

### Fixed

- Error when qbusconfig.json doesn't exist (thomasddn/qbha#4)


## 0.2.0 - 2023-10-28

### Added

- Log version on startup

### Fixed

- Fix permission issue


## 0.1.0 - 2023-10-24

### Added

- Initial version
