import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:window_manager/window_manager.dart';

import 'presentation/home_screen.dart';
import 'presentation/keymap_window.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (args.firstOrNull == 'multi_window') {

    final argument = args[2].isEmpty
        ? const {}
        : jsonDecode(args[2]) as Map<String, dynamic>;
        

    final argsStr = argument['args'] as String? ?? '';
    
    if (argsStr == 'guide_window') {
      await windowManager.ensureInitialized();
      WindowOptions windowOptions = const WindowOptions(
        size: Size(650, 500),
        center: true,
        backgroundColor: Colors.transparent,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
      runApp(const GuideWindowApp());
    } else {
      runApp(const SizedBox());
    }
  } else {
    runApp(const SinglishWriterApp());
  }
}

class SinglishWriterApp extends StatelessWidget {
  const SinglishWriterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singlish to Sinhala Translator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class GuideWindowApp extends StatelessWidget {
  const GuideWindowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typing Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: const KeymapWindow(),
      ),
    );
  }
}
