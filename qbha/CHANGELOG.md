# Changelog

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
