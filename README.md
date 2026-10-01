# QR Generator & Scanner

A Flutter application that allows users to **generate QR codes** from text or URLs and **scan QR codes** using the device camera.

## 📱 About the Project

**QR Generator & Scanner** is a simple Flutter application developed to demonstrate QR code generation and QR code scanning.

The application provides two main functions:

* 🔳 **Generate QR Code**
* 📷 **Scan QR Code**

Users can enter text or a URL to generate a QR code. They can also use their device camera to scan an existing QR code and view the scanned information.

This project is suitable for learning Flutter, Dart, widgets, packages, camera access, and basic state management.

---

## ✨ Features

### 🔳 QR Code Generator

* Enter text, a URL, or other information.
* Generate a QR code from the entered data.
* Display the generated QR code inside the application.
* Simple and easy-to-use interface.

### 📷 QR Code Scanner

* Open the device camera.
* Scan an existing QR code.
* Read the information stored inside the QR code.
* Display the scanned result.
* Scan another QR code when required.

---

## 🛠️ Technologies Used

| Technology         | Purpose                           |
| ------------------ | --------------------------------- |
| **Flutter**        | Application development framework |
| **Dart**           | Programming language              |
| **qr_flutter**     | QR code generation                |
| **mobile_scanner** | QR/barcode scanning               |
| **Android**        | Mobile platform                   |
| **GitHub**         | Source code management            |

---

## 📦 Dependencies

The project uses the following important packages:

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  qr_flutter: ^4.0.0
  mobile_scanner: ^7.0.0
```

The project uses **Dart SDK `^3.11.4`**.

### Package Details

#### qr_flutter

Used to create and display QR codes.

Example:

```dart
QrImageView(
  data: qrData,
  size: 200,
)
```

#### mobile_scanner

Used to scan QR codes and barcodes through the device camera.

Example:

```dart
MobileScanner(
  onDetect: onDetect,
)
```

---

## 📂 Project Structure

The repository currently contains the main Flutter project folders and files, including `android`, `lib`, `test`, `web`, `pubspec.yaml`, and `README.md`.

```text
qr_generator_scanner/
│
├── android/
│
├── lib/
│   ├── main.dart
│   ├── generate_qr_code.dart
│   └── scan_qr_code.dart
│
├── test/
│
├── web/
│
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

> The exact Dart file names inside `lib/` may change as the project is developed.

---

## 🔳 How QR Generation Works

The QR generator takes data entered by the user and converts it into a QR code.

### Process

```text
Enter Text / URL
       ↓
Press Generate
       ↓
Store Entered Data
       ↓
qr_flutter Package
       ↓
Generate QR Code
       ↓
Display QR Code
```

### Example

If the user enters:

```text
https://google.com
```

the application generates a QR code containing that URL.

The QR code can then be scanned using another QR scanner.

---

## 📷 How QR Scanning Works

The scanner uses the device camera through the `mobile_scanner` package.

### Process

```text
Open Scanner
     ↓
Camera Starts
     ↓
Detect QR Code
     ↓
Read QR Data
     ↓
Display Scanned Result
```

For example, if a QR code contains:

```text
Hello World
```

the application displays:

```text
Hello World
```

as the scanned result.

---

## 🔐 Camera Permission

The QR scanner requires access to the device camera.

For Android, make sure the following permission is present in:

```text
android/app/src/main/AndroidManifest.xml
```

```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

The permission should be placed before the `<application>` tag.

Example:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <uses-permission android:name="android.permission.CAMERA"/>

    <application
        android:label="qr_generator"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">

        ...

    </application>

</manifest>
```

---

## 🚀 Getting Started

Follow these steps to run the project on your computer.

### 1. Clone the Repository

```bash
git clone https://github.com/Bhumilpatel56/qr_generator_scanner.git
```

Move into the project folder:

```bash
cd qr_generator_scanner
```

### 2. Check Flutter Installation

Run:

```bash
flutter doctor
```

Make sure Flutter is properly installed and configured.

### 3. Install Dependencies

Run:

```bash
flutter pub get
```

### 4. Connect an Android Device

Connect an Android phone using USB and enable **USB Debugging**.

Check whether Flutter detects your device:

```bash
flutter devices
```

### 5. Run the Application

```bash
flutter run
```

---

## ▶️ How to Use the Application

### Generate a QR Code

1. Open the QR Generator screen.
2. Enter text, a URL, or other data.
3. Press the **Generate** button.
4. The QR code will appear on the screen.
5. The generated QR code can be scanned using a QR scanner.

### Scan a QR Code

1. Open the QR Scanner screen.
2. Press **Scan Code**.
3. Allow camera permission when requested.
4. Point the camera toward a QR code.
5. The application detects the QR code.
6. The scanned data appears on the screen.
7. Scan another code when required.

---

## 🔄 Application Flow

```text
              START
                │
                ▼
        Open QR Application
                │
                ▼
        ┌─────────────────┐
        │ Select Function │
        └─────────────────┘
           │           │
           ▼           ▼
       GENERATE       SCAN
           │           │
           ▼           ▼
      Enter Data    Open Camera
           │           │
           ▼           ▼
     Press Generate  Detect QR
           │           │
           ▼           ▼
      Generate QR   Read QR Data
           │           │
           ▼           ▼
      Display QR   Display Result
```

---

## 🧠 Flutter Concepts Used

This project demonstrates several basic Flutter concepts:

* `MaterialApp`
* `Scaffold`
* `AppBar`
* `StatefulWidget`
* `setState()`
* `TextField`
* `TextEditingController`
* `ElevatedButton`
* `Column`
* `Center`
* `SingleChildScrollView`
* QR code generation
* Camera-based QR scanning
* Flutter package management
* Android permissions

---

## 🧹 Troubleshooting

### Problem: Dependencies are not found

Run:

```bash
flutter clean
flutter pub get
```

Then:

```bash
flutter run
```

### Problem: Camera does not open

Check that camera permission is present:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

Also make sure camera permission has been granted on the Android device.

### Problem: Old barcode scanner error

This project uses:

```yaml
mobile_scanner: ^7.0.0
```

for scanning.

Do not add the old:

```yaml
flutter_barcode_scanner
```

package unless the project code is specifically changed to support it.

---

## 🔮 Future Improvements

The application can be improved by adding:

* 📋 Copy scanned result
* 🔗 Open scanned URLs
* 📤 Share generated QR codes
* 💾 Save QR codes as images
* 🕘 QR scan history
* 🗑️ Delete scan history
* 📶 Wi-Fi QR code generation
* 👤 Contact QR code generation
* 📱 Better responsive UI
* 🌙 Dark mode
* 📊 Barcode support

---

## 🎓 Purpose of the Project

This project is created as a **Flutter learning/project application** to understand:

* Mobile application development
* Dart programming
* Flutter widgets
* QR code technology
* Camera integration
* Third-party Flutter packages
* State management using `setState()`
* Android application permissions
* Git and GitHub project management

---

## 👨‍💻 Author

**Bhumil Patel**

GitHub Repository:

**qr_generator_scanner**

---

## 📄 License

This project is created for educational and learning purposes.

---

## ⭐ Repository

You can find the complete project source code on GitHub:

[QR Generator & Scanner – GitHub Repository](https://github.com/Bhumilpatel56/qr_generator_scanner?utm_source=chatgpt.com)
