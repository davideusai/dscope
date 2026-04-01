# D‑Scope — Sketches Index

This document lists all existing D‑Scope **sketches**.  
A *sketch* is an exploratory prototype used to validate a sensor, module, or feature before promoting it to an official **module** in the hardware ecosystem.


Sketches are intentionally simple, isolated, and focused on validating one concept at a time.

---

# 📚 List of Sketches

## 1. DS18B20 — Digital Temperature Sensor
**Goal:**  
Validate temperature reading using the DS18B20 OneWire sensor.

**Key points:**  
- Stable temperature measurement  
- Pull‑up resistor validation  
- 3‑wire wiring  
- Basic reliability tests  

**Hardware:** Arduino Uno + DS18B20 + 4.7kΩ resistor

---

## 2. PT1000 — Analog Temperature Sensor
**Goal:**  
Validate temperature measurement using a PT1000 and a voltage divider.

**Key points:**  
- Analog reading  
- Resistance‑to‑temperature conversion (IEC 60751)  
- Voltage divider stability  
- Precision evaluation  

**Hardware:** Arduino Uno + PT1000 + 1kΩ reference resistor

---

## 3. LCD I2C — Liquid Crystal Display
**Goal:**  
Validate text display on a 16×2 or 20×4 LCD using I2C.

**Key points:**  
- I2C communication  
- Backlight and contrast  
- Static and dynamic text  
- Readability tests  

**Hardware:** Arduino Uno + LCD I2C (PCF8574)

---

## 4. DS3231 — Real‑Time Clock (RTC)
**Goal:**  
Validate time, date, and internal temperature reading from the DS3231.

**Key points:**  
- I2C communication  
- Clock stability  
- Battery‑backed time retention  
- Temperature sensor accuracy  

**Hardware:** Arduino Uno + DS3231

---

## 5. Micro SD Card — SPI Storage Module
**Goal:**  
Validate reading and writing files on a micro‑SD card via SPI.

**Key points:**  
- SD card initialization  
- File creation and reading  
- Error handling (card removed, full card, existing file)  
- Preparation for D‑Scope logging  

**Hardware:** Arduino Uno + Micro SD SPI module

---

## 6. LCD Temperature Display — DS18B20 + LCD I2C  
**Goal:**  
Validate the ability to read temperature from the DS18B20 sensor and display it on a 16×2 or 20×4 LCD using an I2C interface.

**Key points:**  
- OneWire temperature acquisition from DS18B20  
- I2C communication with LCD (PCF8574)  
- Real‑time temperature display  
- Readability and refresh‑rate validation  
- Unified `key=value` output for serial monitoring  
- Foundation for user‑facing modules with local display  

**Hardware:**  
Arduino Uno + DS18B20 + 4.7kΩ pull‑up resistor + LCD I2C (PCF8574)

**Why it matters:**  
This draft validates the integration of a digital temperature sensor with a user‑facing display.  
It ensures that OneWire timing does not interfere with I2C communication and that the LCD can refresh cleanly while temperature readings are acquired.  
This experiment lays the groundwork for future D‑Scope modules that require **local visualization**, such as thermostats, environmental monitors, or standalone diagnostic tools.

---

## 7. LCD Temperature & Time Display — DS18B20 + DS3231 + LCD I2C  
**Goal:**  
Validate the ability to read temperature from the DS18B20 and time/date from the DS3231, then display both on a 16×2 or 20×4 LCD using an I2C interface.

**Key points:**  
- OneWire temperature acquisition (DS18B20)  
- I2C communication with both DS3231 and LCD (PCF8574)  
- Real‑time display of temperature + time  
- Refresh‑rate and readability validation  
- Unified `key=value` output for serial monitoring  
- Demonstrates multi‑sensor + display integration  

**Hardware:**  
Arduino Uno + DS18B20 + 4.7kΩ pull‑up resistor + DS3231 RTC module + LCD I2C (PCF8574)

**Why it matters:**  
This draft validates the integration of **two sensors** and a **display** on the same microcontroller.  
It ensures that OneWire timing does not interfere with I2C operations and that the LCD can refresh cleanly while reading both temperature and time.  
This experiment is a key step toward user‑facing D‑Scope modules that require **local visualization**, such as clocks, thermostats, environmental dashboards, or standalone diagnostic tools.

---

## 8. SD Card Logging — Temperature & Time Recording  
**Goal:**  
Validate the ability to create and append log entries to a file stored on a micro‑SD card using SPI, recording temperature and time values acquired from previous Sketches.

**Key points:**  
- SPI communication with the SD card module  
- File creation and append mode validation  
- Logging of `temp` and `time` values in a structured format  
- Error handling: missing card, full card, write failure  
- Ensuring logging does not interfere with sensor acquisition  
- Foundation for long‑term data recording modules  

**Hardware:**  
Arduino Uno + Micro SD SPI module + DS18B20 + DS3231

**Why it matters:**  
This draft validates the integration of **data acquisition** and **persistent storage**.  
It ensures that SPI operations can run alongside OneWire and I2C without timing conflicts, and that log files can be reliably created and updated.  
This experiment is a key step toward D‑Scope modules that require **historical data**, such as environmental monitoring, diagnostics, or long‑term trend analysis.

---

## 9. PIC Temperature Front‑End — PIC + DS18B20 + UART Link  
**Goal:**  
Validate the use of a PIC microcontroller as a dedicated front‑end for the DS18B20 temperature sensor, sending preprocessed temperature data to an Arduino Uno through a wired UART connection.

**Key points:**  
- PIC handles the DS18B20 OneWire protocol  
- Local preprocessing: filtering, averaging, conversion to °C  
- Stable digital output using a simple UART text frame  
- Arduino Uno receives clean `temp=value` messages  
- Demonstrates separation of concerns: PIC as sensor adapter, Arduino as host  
- Prepares the foundation for modular, microcontroller‑based D‑Scope sensing blocks  

**Hardware:**  
PIC microcontroller (e.g., PIC16F1827 / PIC12F1840) + DS18B20 + 4.7kΩ pull‑up resistor + PICKIT programmer + Arduino Uno + UART cable (TX/RX/GND)

**Why it matters:**  
This draft validates a **distributed architecture** where the PIC acts as a smart sensor module.  
The PIC performs precise temperature acquisition and preprocessing, then outputs a clean `key=value` frame to the Arduino.  
This approach mirrors industrial sensor design and enables highly modular D‑Scope systems where each sensor block is autonomous, low‑power, and easy to integrate.  
It also prepares the path for future modules where multiple PIC‑based sensors communicate with a central hub.

---

## 10. Wireless PIC Temperature Front‑End — PIC + DS18B20 + Radio Link  
**Goal:**  
Validate the use of a PIC microcontroller as a wireless front‑end for the DS18B20 temperature sensor, sending preprocessed temperature data to an Arduino Uno through a radio module instead of a wired UART connection.

**Key points:**  
- PIC handles the DS18B20 OneWire protocol  
- Local preprocessing: filtering, averaging, conversion to °C  
- Wireless transmission of `temp=value` frames  
- Arduino Uno receives and parses radio messages  
- Demonstrates a fully decoupled sensor block (no cable)  
- Prepares the foundation for distributed, battery‑powered D‑Scope modules  

**Hardware:**  
PIC microcontroller (e.g., PIC16F1827 / PIC12F1840) + DS18B20 + 4.7kΩ pull‑up resistor + PICKIT programmer  
+ Radio modules (e.g., HC‑12, nRF24L01, or LoRa depending on range needs)  
+ Arduino Uno

**Why it matters:**  
This draft validates a **wireless distributed architecture**, where the PIC acts as a smart, autonomous sensor node.  
The PIC performs precise temperature acquisition and preprocessing, then transmits a clean `key=value` frame over radio to the Arduino.  
This approach enables highly modular D‑Scope systems where sensors can be placed anywhere, powered independently, and communicate without wiring constraints.  
It also prepares the path for future D‑Scope modules involving **mesh networks**, **remote sensing**, or **multi‑node environmental monitoring**.

---

## 11. STM32 Hub Prototype — Replacing Arduino Uno with an STM32 Board  
**Goal:**  
Validate the migration of the Hub prototype from an Arduino Uno to an **STM32 microcontroller**, preparing the foundation for the production‑grade Hub running FreeRTOS.

**Key points:**  
- Replace Arduino‑based logic with STM32 HAL or LL drivers  
- Validate UART, I2C, SPI, and GPIO mappings on STM32  
- Reproduce existing Arduino sketches (uplink, parsing, LCD, SD, RTC…)  
- Establish a clean project structure for future FreeRTOS integration  
- Measure performance improvements (timing, multitasking, peripherals)  
- Confirm compatibility with PIC‑based sensor modules and radio links  

**Hardware:**  
STM32 development board (e.g., STM32F103C8 “Blue Pill”, Nucleo‑64, or STM32F4 series)  
+ DS18B20 / DS3231 / LCD I2C / SD module (depending on the test)  
+ USB‑UART adapter for debugging  
+ ST‑Link programmer

**Why it matters:**  
This sketch validates the **transition from Arduino prototyping to STM32‑based production hardware**.  
It ensures that all essential Hub features — sensor uplink, parsing, display, storage, and communication — can run reliably on an STM32 platform.  
This step is crucial before introducing **FreeRTOS**, which will allow the Hub to run multiple tasks in parallel (uplink, parsing, SD logging, LCD updates, heartbeat…).  
It also establishes the long‑term hardware foundation for the D‑Scope Hub.

---

## 12. STM32 FreeRTOS Integration — Multitasking Hub Prototype  
**Goal:**  
Validate the integration of **FreeRTOS** on an STM32 microcontroller and reproduce the core Hub architecture using multiple concurrent tasks (uplink, parsing, SD logging, LCD updates, heartbeat).

**Key points:**  
- Configure FreeRTOS on STM32 (heap, tick, priorities, scheduler)  
- Create multiple tasks mirroring the future Hub architecture  
- Validate inter‑task communication using queues and mutexes  
- Test UART uplink reception in a dedicated task  
- Test LCD or serial output in a separate display task  
- Test SD card logging in an isolated low‑priority task  
- Implement a heartbeat task for supervision  
- Measure timing, jitter, and task responsiveness  
- Establish the foundation for the production Hub firmware  

**Hardware:**  
STM32 development board (e.g., STM32F103C8 “Blue Pill”, Nucleo‑64, or STM32F4 series)  
+ USB‑UART adapter for debugging  
+ Optional peripherals depending on the test:  
  - DS18B20  
  - DS3231  
  - LCD I2C (PCF8574)  
  - Micro SD SPI module  

**Why it matters:**  
This sketch validates the **multitasking architecture** that will power the production D‑Scope Hub.  
FreeRTOS enables clean separation of responsibilities:  
- one task for uplink reception  
- one task for parsing  
- one task for SD logging  
- one task for display  
- one task for supervision  

This structure mirrors industrial embedded systems and ensures that the Hub can scale to multiple sensors, radio links, and storage operations without blocking or timing conflicts.  
This sketch is the final step before building the **production‑grade Hub firmware**, where FreeRTOS becomes the backbone of the entire system.

---

## 13. STM32 FreeRTOS Integration — SD Logging + LCD Display + UART Uplink  
**Goal:**  
Validate a full FreeRTOS‑based Hub prototype on STM32, combining three essential subsystems running in parallel:  
1) UART uplink reception  
2) LCD display updates  
3) SD card logging via SPI  

This sketch reproduces the core architecture of the future D‑Scope Hub using real multitasking.

**Key points:**  
- FreeRTOS project structure on STM32 (tasks, priorities, stack sizes)  
- UART uplink task receiving `key=value` frames  
- Parsing task (optional but recommended)  
- LCD task updating the display without blocking other tasks  
- SD logging task writing asynchronously using queues  
- Mutex protection for shared peripherals (LCD, SD)  
- Queue‑based communication between tasks  
- Validation of timing, jitter, and inter‑task isolation  
- Demonstrates the Hub’s real‑time behavior under load  

**Hardware:**  
STM32 development board (e.g., STM32F103C8 “Blue Pill”, Nucleo‑64, or STM32F4 series)  
+ USB‑UART adapter for uplink debugging  
+ LCD I2C (PCF8574)  
+ Micro SD SPI module  
+ Optional sensors (DS18B20, DS3231) for real data  

**Task Architecture:**  
- **TaskUplink** → Reads UART frames from PIC modules or radio receivers  
- **TaskParser** → Converts raw frames into structured `key=value` messages  
- **TaskLCD** → Displays selected fields on the LCD (mutex‑protected)  
- **TaskSD** → Logs messages to SD card asynchronously  
- **TaskHeartbeat** → System supervision (1 Hz)  

**Why it matters:**  
This sketch is the **first fully integrated version** of the D‑Scope Hub running on STM32 with FreeRTOS.  
It validates that UART reception, LCD updates, and SD logging can run **simultaneously** without blocking each other — a requirement for the production Hub.  

It also demonstrates:  
- clean separation of responsibilities  
- deterministic behavior under multitasking  
- safe access to shared peripherals  
- scalable architecture for future modules  

This sketch is the final milestone before building the **production‑grade Hub firmware**, where additional features (radio uplink, registry, MQTT, configuration, diagnostics) will be layered on top of this multitasking foundation.

---

## 14. STM32 FreeRTOS + Radio Uplink — HC‑12 / LoRa / nRF24  
**Goal:**  
Validate wireless uplink reception on STM32 using FreeRTOS, replacing the wired UART link with a radio module (HC‑12, LoRa SX127x, or nRF24L01).  
This sketch demonstrates a fully wireless sensor → Hub pipeline.

**Key points:**  
- Integrate a radio module as the primary uplink  
- Validate reception of `key=value` frames over RF  
- Create a dedicated FreeRTOS task for radio polling or interrupt‑driven reception  
- Use queues to forward received frames to parsing and logging tasks  
- Ensure radio timing does not block LCD or SD tasks  
- Validate coexistence of RF + LCD + SD + UART debug  
- Prepare the foundation for multi‑node wireless D‑Scope networks  

**Supported Radio Modules:**  
- **HC‑12** → simple UART‑based long‑range serial radio  
- **LoRa SX1276/SX1278** → long‑range, low‑power, packet‑based  
- **nRF24L01** → short‑range, high‑speed 2.4 GHz  

Each module can be tested independently depending on range and topology needs.

**Hardware:**  
STM32 development board (e.g., STM32F103C8 “Blue Pill”, Nucleo‑64, STM32F4 series)  
+ One of the following radio modules:  
  - HC‑12 (UART)  
  - LoRa SX127x (SPI)  
  - nRF24L01 (SPI)  
+ Optional peripherals:  
  - LCD I2C (PCF8574)  
  - Micro SD SPI module  
  - USB‑UART for debug  

**Task Architecture:**  
- **TaskRadio** → Receives wireless frames (UART or SPI depending on module)  
- **TaskParser** → Converts raw RF frames into structured `key=value` messages  
- **TaskLCD** → Displays selected fields (mutex‑protected)  
- **TaskSD** → Logs messages asynchronously  
- **TaskHeartbeat** → System supervision (1 Hz)  

**Why it matters:**  
This sketch validates the **first fully wireless version** of the D‑Scope Hub.  
It ensures that radio reception can run in parallel with LCD updates, SD logging, and supervision without blocking or timing conflicts.  

It also demonstrates:  
- clean separation between RF reception and processing  
- safe inter‑task communication via queues  
- compatibility with multiple radio technologies  
- scalability toward multi‑node wireless networks  

This sketch is the final step before designing the **production‑grade wireless Hub**, where radio uplink, registry validation, MQTT publishing, and diagnostics will all run concurrently under FreeRTOS.

---

## 15. STM32 FreeRTOS + Registry Integration + Key=Value Normalization  
**Goal:**  
Validate the integration of the **D‑Scope Registry** into the STM32 FreeRTOS Hub and implement the first version of the **key=value normalization pipeline**.  
This sketch ensures that incoming frames from sensors (PIC, radio, UART…) are validated, normalized, and enriched according to the official D‑Scope registry.

**Key points:**  
- Load a minimal embedded version of the D‑Scope Registry (fields, units, scaling rules)  
- Parse incoming `key=value` frames from UART or radio  
- Validate keys against the registry (existence, type, constraints)  
- Apply normalization rules (scaling, rounding, unit conversion)  
- Enrich frames with metadata (timestamp, source, quality flags)  
- Forward normalized frames to LCD and SD tasks via queues  
- Ensure registry lookups are thread‑safe (mutex or read‑only memory)  
- Prepare the foundation for the production Hub’s semantic layer  

**Hardware:**  
STM32 development board (e.g., STM32F103C8 “Blue Pill”, Nucleo‑64, STM32F4 series)  
+ USB‑UART or radio module (HC‑12 / LoRa / nRF24)  
+ Optional peripherals:  
  - LCD I2C (PCF8574)  
  - Micro SD SPI module  

**Task Architecture:**  
- **TaskUplink** → Receives raw frames (`temp=21.4`, `hum=58`, `bat=3.01`)  
- **TaskParser** → Splits key/value pairs and forwards them  
- **TaskRegistry** → Validates and normalizes according to DS‑000 registry  
- **TaskLCD** → Displays normalized values  
- **TaskSD** → Logs normalized frames  
- **TaskHeartbeat** → System supervision  

**Normalization Examples:**  
- `temp=214` with scale ×0.1 → `temp=21.4°C`  
- `hum=582` with scale ×0.1 → `hum=58.2%`  
- `bat=3010` mV → `bat=3.01V`  
- `co2=812` ppm → unchanged (already normalized)  

**Why it matters:**  
This sketch introduces the **semantic layer** of the D‑Scope Hub.  
It ensures that all incoming data — wired or wireless — is interpreted consistently according to the official registry.  

This step is essential because it:  
- guarantees interoperability between modules  
- ensures consistent units and scaling  
- prepares the Hub for MQTT publishing and dashboards  
- mirrors the behavior of the future Analyzer  
- establishes the foundation for alarms, thresholds, and diagnostics  

This sketch is the first version of the **production‑grade normalization pipeline**, which will later be extended with:  
- dynamic registry updates  
- module identification  
- quality flags  
- error reporting  
- MQTT publishing  
- local configuration  

---

## 16. STM32 FreeRTOS + MQTT Local Publishing (ESP8266 / ESP32 / Ethernet)

**Goal:**  
Validate local MQTT publishing from the STM32 FreeRTOS Hub using a Wi‑Fi module (ESP8266/ESP32) or an Ethernet interface.  
This sketch demonstrates the first end‑to‑end pipeline:  
**wireless sensor → STM32 Hub → normalization → MQTT → local network**.

**Key points:**  
- Integrate an MQTT client running on an external module (ESP8266 AT, ESP32 custom firmware, or W5500 Ethernet)  
- Establish a stable TCP/IP connection to the local broker (Mosquitto, Home Assistant, etc.)  
- Publish normalized `key=value` frames from the Registry task  
- Use a dedicated FreeRTOS task for MQTT publishing  
- Ensure non‑blocking communication (queues, timeouts, watchdog)  
- Validate coexistence of MQTT + LCD + SD + Radio + UART debug  
- Prepare the foundation for the production Hub’s network layer  

**Supported Network Interfaces:**  
- **ESP8266 (AT commands)** → simplest integration, UART‑based  
- **ESP32 (custom firmware)** → more flexible, UART or SPI  
- **W5500 Ethernet** → deterministic, no Wi‑Fi latency  
- **ENC28J60 Ethernet** → alternative SPI Ethernet controller  

Each interface can be tested independently depending on network constraints.

**Hardware:**  
STM32 development board (e.g., STM32F103C8 “Blue Pill”, Nucleo‑64, STM32F4 series)  
+ One of the following network modules:  
  - ESP8266 (UART)  
  - ESP32 (UART/SPI)  
  - W5500 Ethernet (SPI)  
  - ENC28J60 Ethernet (SPI)  
+ Optional peripherals:  
  - LCD I2C (PCF8574)  
  - Micro SD SPI module  
  - Radio uplink (HC‑12 / LoRa / nRF24)  

**Task Architecture:**  
- **TaskUplink** → Receives raw frames (radio or UART)  
- **TaskParser** → Splits key/value pairs  
- **TaskRegistry** → Validates + normalizes according to DS‑000  
- **TaskMQTT** → Publishes normalized frames to the local broker  
- **TaskLCD** → Displays selected values  
- **TaskSD** → Logs normalized frames  
- **TaskHeartbeat** → System supervision  

**MQTT Publishing Examples:**  
Topic structure (recommended):  
dscope/<module_id>/<field>


Examples:  
- `dscope/comfort/temp` → `21.4`  
- `dscope/comfort/hum` → `58.2`  
- `dscope/energy/power` → `812`  
- `dscope/hvac/state` → `1`  

**Why it matters:**  
This sketch introduces the **network layer** of the D‑Scope Hub.  
It validates that the Hub can publish normalized data to a local MQTT broker without blocking other tasks.  

This step is essential because it:  
- connects the Hub to dashboards (Home Assistant, Grafana, Node‑RED…)  
- enables real‑time visualization  
- prepares the Hub for configuration, diagnostics, and OTA updates  
- mirrors the behavior of the future Analyzer  
- establishes the foundation for the full D‑Scope ecosystem  

This sketch is the first version of the **production‑grade MQTT pipeline**, which will later be extended with:  
- retained messages  
- LWT (Last Will & Testament)  
- dynamic topic generation  
- module identification  
- QoS tuning  
- local configuration via MQTT  

---

## 17. STM32 FreeRTOS + Diagnostics + Watchdog + Error Flags

**Goal:**  
Validate the diagnostic and supervision layer of the STM32 FreeRTOS Hub, including hardware watchdog, software watchdogs, error flags, and system‑health reporting.  
This sketch ensures that the Hub can detect failures, recover safely, and expose its internal state.

**Key points:**  
- Enable and configure the STM32 **Independent Watchdog (IWDG)**  
- Add **software watchdogs** for critical tasks (uplink, parser, registry, MQTT, SD, LCD)  
- Implement **error flags** for peripheral failures (radio, SD, LCD, UART, registry)  
- Add a **diagnostic queue** to centralize system‑health events  
- Display system status on LCD and/or UART debug  
- Log diagnostic events to SD card  
- Validate recovery behavior (task restart, watchdog reset, error propagation)  
- Prepare the foundation for the production Hub’s reliability layer  

**Hardware:**  
STM32 development board (e.g., STM32F103C8 “Blue Pill”, Nucleo‑64, STM32F4 series)  
+ Optional peripherals:  
  - LCD I2C (PCF8574)  
  - Micro SD SPI module  
  - Radio uplink (HC‑12 / LoRa / nRF24)  
  - ESP8266/ESP32 or Ethernet module (if combined with Sketch 16)  

**Task Architecture:**  
- **TaskUplink** → Must “kick” its software watchdog  
- **TaskParser** → Reports malformed frames  
- **TaskRegistry** → Reports unknown keys or normalization errors  
- **TaskMQTT** → Reports connection failures  
- **TaskSD** → Reports write errors or missing card  
- **TaskLCD** → Reports I2C failures  
- **TaskDiagnostics** → Centralizes all error flags and events  
- **TaskHeartbeat** → Feeds the hardware watchdog  

**Error Flags (examples):**  
- `ERR_RADIO_TIMEOUT` → No RF frame received for X seconds  
- `ERR_SD_WRITE` → SD write failure  
- `ERR_LCD_I2C` → LCD not responding  
- `ERR_MQTT_CONN` → MQTT broker unreachable  
- `ERR_REGISTRY_KEY` → Unknown or invalid key  
- `ERR_TASK_STALL` → A task failed to refresh its software watchdog  

**Diagnostic Outputs:**  
- UART debug stream (recommended)  
- LCD “status line” (optional)  
- SD log file (`diag.log`)  
- MQTT topic (if combined with Sketch 16):  

dscope/hub/status
dscope/hub/errors


**Why it matters:**  
This sketch introduces the **reliability layer** of the D‑Scope Hub.  
It ensures that the system can:  
- detect failures  
- isolate faulty tasks  
- recover automatically  
- report its internal state  
- avoid silent data corruption  
- reboot safely if needed  

This is a critical step toward a **production‑grade embedded system**, where robustness is as important as functionality.  
It also prepares the Hub for future features such as:  
- persistent error counters  
- self‑diagnostic reports  
- remote monitoring via MQTT  
- safe‑mode boot  
- firmware integrity checks  

---

## 18. STM32 FreeRTOS + Local Configuration (EEPROM / Flash / MQTT)

**Goal:**  
Validate the configuration subsystem of the STM32 FreeRTOS Hub, including persistent storage (EEPROM or Flash), runtime configuration loading, and optional remote updates via MQTT.  
This sketch ensures that the Hub can store its parameters, reload them at boot, and update them dynamically.

**Key points:**  
- Implement a **configuration manager** task  
- Store configuration in EEPROM (external) or Flash (internal)  
- Define a minimal configuration schema (module_id, radio settings, MQTT topics, logging options…)  
- Load configuration at boot before starting functional tasks  
- Allow runtime updates via MQTT (optional)  
- Validate persistence across reboots  
- Protect configuration access with mutexes  
- Provide a safe “factory reset” mechanism  
- Prepare the foundation for the production Hub’s configuration layer  

**Hardware:**  
STM32 development board (e.g., STM32F103C8 “Blue Pill”, Nucleo‑64, STM32F4 series)  
+ Optional peripherals:  
  - External EEPROM (24LC256) via I2C  
  - Micro SD SPI module (alternative storage)  
  - ESP8266/ESP32 or Ethernet module (if combined with Sketch 16)  
  - Radio uplink (HC‑12 / LoRa / nRF24)  

**Configuration Schema (example):**  
```json
{
  "module_id": "hub01",
  "radio": {
    "type": "hc12",
    "baud": 9600
  },
  "mqtt": {
    "enabled": true,
    "topic_prefix": "dscope/hub01",
    "retain": false
  },
  "logging": {
    "sd_enabled": true,
    "interval_ms": 1000
  }
}
