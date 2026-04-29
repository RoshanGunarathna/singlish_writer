# Singlish to Sinhala Translator (singlish_writer)

A beautiful, native macOS application built with Flutter that allows you to type Sinhala using Singlish phonetics in real-time. 

## Features

- **Real-Time Translation**: Type in Singlish and instantly see the Sinhala Unicode output.
- **Floating Typing Guide**: Includes an interactive, draggable multi-window typing guide that serves as a reference for vowels, consonants, and special character combinations without blocking your workflow.
- **Native macOS Experience**: Features a native macOS window integration, clipboard support, and a responsive glassmorphism UI optimized for Light and Dark modes.
- **Custom Iconography**: Ships with a custom-designed app icon generated for macOS.

## Development Steps

Here are the key steps taken to build this project:

1. **Cloned the Reference Project**: Analyzed the original Java phonetic logic and port it into Dart.
2. **Built the Core Translation Engine**: Recreated the string substitution arrays and algorithms for parsing Singlish keystrokes in Dart (`translater_logic.dart`).
3. **Created the UI**: Used Flutter's Material 3 design to build a clean two-pane layout (`home_screen.dart`).
4. **Added Multi-Window Support**: Integrated `desktop_multi_window` and `window_manager` plugins, updating the native Swift entry point (`MainFlutterWindow.swift`) to spawn standalone macOS windows.
5. **Designed the Typing Guide**: Extracted the key mappings into a clean, themed reference window that can be launched independently.
6. **Generated App Icon**: Generated a sleek app icon and injected it using `flutter_launcher_icons`.
7. **Configured CI/CD**: Added GitHub Actions to automatically build the macOS `.app` bundle on every push.

## Acknowledgments & Reference

This project is a modern Flutter port inspired by the work done in the [Singlish-To-Sinhala-Translater](https://github.com/kaminduN/Singlish-To-Sinhala-Translater) repository by **kaminduN**. 

A special thanks to the original creators at the University of Colombo School of Computing (UCSC), who developed the foundational real-time font encoding tool that served as the base for this logic ([UCSC Real-time Converter](http://ucsc.lk/ltrl/services/feconverter/t1.html)).

## Installation

The pre-built macOS application is automatically generated and published in the **Releases** section of this repository.

1. Go to the [Releases](https://github.com/RoshanGunarathna/singlish_writer/releases) tab.
2. Download the latest `singlish_writer-macos.zip` file.
3. Extract the zip file and drag `singlish_writer.app` to your Applications folder.

> ⚠️ **macOS Security Warning (Unidentified Developer)**
> Because this app is open-source and not published through the Mac App Store or signed with a paid Apple Developer certificate, macOS Gatekeeper will show a warning ("*cannot be opened because the developer cannot be verified*") when you first try to open it.
> 
> **To bypass this on the first run:**
> 1. Do not double-click the app. Instead, **Right-Click (or Control-Click)** the `singlish_writer.app` icon.
> 2. Select **Open** from the context menu.
> 3. In the dialog that appears, click **Open** again. 
> You only need to do this the very first time!

## Building the App

To build this app manually for macOS:
```bash
flutter build macos
```
You will find the compiled application inside `build/macos/Build/Products/Release/singlish_writer.app`.

---

## 🟢 Privacy & Security

🛡️ **100% Private & Offline**: This Unicode translator app runs entirely locally on your machine. It **does not** collect, track, or transmit any of your typing text, keystrokes, or personal user information. Your data remains completely secure and never leaves your device!
