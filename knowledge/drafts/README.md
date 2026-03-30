# D‑Scope — Drafts Index

This document lists all existing D‑Scope playgrounds.  
A *playground* is an experimental area used to validate a sensor, module, or feature before promoting it to a **sketch**, and eventually to an official **module**.

Lifecycle:
playground → sketch → module


Playgrounds are intentionally simple, isolated, and focused on validating one concept at a time.

---

# 📚 List of Playgrounds

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

## 6. PIC‑Based Sensor Front‑End
**Goal:**  
Validate the use of a PIC microcontroller as a dedicated front‑end for a sensor, acting as a “smart sensor adapter”.

**Key points:**  
- PIC handles the sensor reading (analog or digital)  
- Local preprocessing: filtering, averaging, linearization  
- Stable digital output (UART recommended for the first iteration)  
- Arduino Uno receives clean, preprocessed values  
- Demonstrates how a PIC can serve as a low‑power co‑processor  

**Hardware:**  
Arduino Uno + PIC microcontroller (e.g., PIC16F1827 / PIC12F1840) + PICKIT programmer + chosen sensor

**Why it matters:**  
This playground explores the concept of a **smart sensor module**, where a PIC performs precise signal conditioning and outputs a clean `key=value` frame. This approach mirrors industrial sensor design and prepares the foundation for future D‑Scope modules using microcontroller‑based sensing blocks.

---

# 🧱 Recommended Playground Structure
ds18b20/
pt1000/
lcd/
ds3231/
sdcard/
pic-sensor/

---

# 🚀 Next Steps

Once a playground is validated, it can be promoted to a **sketch**, which includes:

- clean and structured code  
- key=value output format  
- minimal documentation  
- progressive integration into the D‑Scope standard  

---

# 🧭 Notes

This index evolves as new playgrounds are added.  
It serves as a quick reference for ongoing and future experiments.
