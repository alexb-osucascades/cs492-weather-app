# Weather App written in Flutter

Welcome to a Weather App written in flutter! This application was developed as a final project for CS492 (Mobile App Development). It provides real-time weather forecasts, dynamic imagery, and location tracking wrapped in a clean, modern UI.


## Overview

The Flutter Weather App is a cross-platform mobile application that allows users to look up weather forecasts by city, zip code, or their device's GPS location. 

**Key Features:**
* **Real-time Forecasts:** Fetches up-to-date weather data from the National Weather Service (weather.gov) API.
* **Dynamic Imagery:** Utilizes the Pexels API to generate beautiful, context-aware background images based on the current weather description and time of day.
* **Location Management:** Save, manage, and delete favorite locations using a persistent local SQLite database. 
* **Custom Themes:** Supports light and dark mode toggling, alongside dynamic gradient UI elements based on daytime/nighttime forecasting.

## Deployment & Setup Instructions

Assuming you are new to Flutter, follow these steps to get the app running on your local machine.

### 1. Install Flutter & Prerequisites
Before cloning the app, you need to have the Flutter SDK installed and an emulator (or physical device) configured.
* **Download Flutter:** Follow the official [Flutter Installation Guide](https://docs.flutter.dev/get-started/install) for your specific operating system (Windows, macOS, or Linux).
* **Setup an Editor:** I recommend installing [Visual Studio Code](https://code.visualstudio.com/) along with the Flutter and Dart extensions.
* **Verify Setup:** Open your terminal and run `flutter doctor`. This will check your environment and display any missing dependencies you need to install.

### 2. Clone the Repository
Once Flutter is installed and ready, clone this repository to your local machine:

```bash
git clone [https://github.com/alexb-osucascades/cs492-weather-app.git](https://github.com/alexb-osucascades/cs492-weather-app.git)
cd cs492-weather-app
```