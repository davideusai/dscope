# D‑Scope — Drafts Index

This document lists all existing D‑Scope playgrounds.  
A *draft* is an experimental area used to validate a sensor, module, or feature before promoting it to a **sketch**, and eventually to an official **module**.

Lifecycle:
draft → sketch → module


Drafts are intentionally simple, isolated, and focused on validating one concept at a time.

---

# 📚 List of Drafts

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
Validate the ability to create and append log entries to a file stored on a micro‑SD card using SPI, recording temperature and time values acquired from previous drafts.

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