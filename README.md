# ESP-DHT

This is my project to get some temperature humidity sensors setup at home.

I was inspired by the LWN article on ESPHome and by [the blog of Chris](https://blog.christophersmart.com/2020/03/31/defining-home-automation-devices-in-yaml-with-esphome-and-home-assistant-no-programming-required/)

The shell script creates a python virtual environment to work in, the rest is standard ESPHome stuff.

## Example device config

```yaml
esphome:
  name: dht-11
  build_path: ./builds/dht-11
  platform: ESP8266
  board: thingdev

wifi:
  ssid: !secret wifi_ssid
  password: !secret wifi_password

# Enable logging
logger:

# Enable Home Assistant API
api:
  password: !secret api_password

# Enable over the air updates
ota:
  password: !secret ota_password

mqtt:
  broker: !secret mqtt_broker
  username: !secret mqtt_username
  password: !secret mqtt_password
  port: !secret mqtt_port
  # Set to true when finished testing to set MQTT retain flag
  discovery_retain: false
```

## Example configuration entry

```yaml
sensor:
  - platform: dht
    pin: 13
    temperature:
      name: "Living Room Temperature"
    humidity:
      name: "Living Room Humidity"
    update_interval: 60s
    model: DHT11
```

## Notes on cheap ESP8266

| ESP-01 (blue PCB) | ESP-01S (black PCB) |
| ------------- | ------------- |
| 512kB flash | 1MB flash |
| Red power LED | **No** power LED |
| Blue LED on TX | Blue LED on GPIO2 (low = on) |

## References

### Door reed switch

* <https://community.home-assistant.io/t/reed-door-sensor-battery-powered-esp32-with-esphome-yaml/70762>
* <https://gist.github.com/bl0rp/6769b7b9d7bd410c1a41408bc0e087b8>
* <https://github.com/bl0rp/Home-AssistantConfig/blob/master/packages/esp32/esp32_1_doorsensor_elw.yaml>
