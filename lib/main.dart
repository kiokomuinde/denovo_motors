// lib/main.dart

import 'package:flutter/material.dart';
import 'pages/home_page.dart';

// --- Brand Colors ---
// Primary: Red (for emphasis and action)
const Color denovoRed = Color(0xFFE31E24);
// Secondary/Accent: Yellow (for highlights and luxury feel)
const Color denovoYellow = Color(0xFFFFC300);
// Text/Background: Black and White (for contrast and elegance)
const Color denovoBlack = Color(0xFF1A1A1A);
const Color denovoWhite = Color(0xFFFFFFFF);

void main() {
  runApp(const DenovoMotorsApp());
}

class DenovoMotorsApp extends StatelessWidget {
  const DenovoMotorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DENOVO MOTORS - We Deliver, You Drive!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // General Theme Settings
        primaryColor: denovoRed,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFFE31E24, // Main Red
            <int, Color>{
              50: Color(0xFFFEE7E8),
              100: Color(0xFFFBC6C8),
              200: Color(0xFFF7A2A5),
              300: Color(0xFFF27E83),
              400: Color(0xFFEF6368),
              500: denovoRed,
              600: Color(0xFFD41B21),
              700: Color(0xFFC3181D),
              800: Color(0xFFB3141A),
              900: Color(0xFFA00D13),
            },
          ),
          accentColor: denovoYellow,
          backgroundColor: denovoWhite,
          cardColor: denovoWhite,
          // MAJOR CHANGE: Set brightness to light (White background theme)
          brightness: Brightness.light, 
        ).copyWith(
          secondary: denovoYellow, // Accent color
          surface: denovoWhite, // Background color for Cards/Surfaces
          onPrimary: denovoWhite, // Text on red buttons
          onSecondary: denovoBlack, // Text on yellow elements
          // MAJOR CHANGE: Text on white surfaces is now black
          onSurface: denovoBlack, 
        ),
        // MAJOR CHANGE: Scaffold background is now white
        scaffoldBackgroundColor: denovoWhite,
        fontFamily: 'Montserrat',

        // Text Theme - Defines how text looks across the app
        textTheme: TextTheme(
          // MAJOR CHANGE: Default display text is now denovoBlack
          displayLarge: TextStyle(color: denovoBlack, fontWeight: FontWeight.w900, letterSpacing: 1.5),
          displayMedium: TextStyle(color: denovoBlack, fontWeight: FontWeight.w800),
          titleLarge: TextStyle(color: denovoRed, fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(color: denovoBlack, fontWeight: FontWeight.w400),
          // Slightly grey for secondary text (now dark grey)
          bodyMedium: TextStyle(color: Color(0xFF555555)), 
        ),

        // Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: denovoRed,
            foregroundColor: denovoWhite,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}