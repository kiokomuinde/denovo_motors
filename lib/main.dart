// lib/main.dart

import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/inventory_page.dart'; // <<< NEW: Import Inventory Page

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

// Placeholder page for routes not yet implemented
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: denovoWhite)),
        backgroundColor: denovoBlack,
        iconTheme: const IconThemeData(color: denovoWhite),
      ),
      body: Center(
        child: Text(
          '$title Page is Under Construction.',
          style: TextStyle(fontSize: 30, color: denovoBlack),
        ),
      ),
    );
  }
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
              300: Color(0xFFF37D81),
              400: Color(0xFFF0656B),
              500: denovoRed,
              600: Color(0xFFC71A1F),
              700: Color(0xFF9E1519),
              800: Color(0xFF751113),
              900: Color(0xFF4C0B0C),
            },
          ),
          // Set primary to Red
          // FIX 1 APPLIED: Removed the invalid 'primaryColorDark' parameter
          accentColor: denovoYellow,
          backgroundColor: denovoWhite,
          cardColor: denovoWhite,
          errorColor: denovoRed,
          brightness: Brightness.light,
        ).copyWith(
          primary: denovoRed,
          secondary: denovoYellow,
          // Text on primary (Red) elements is white
          onPrimary: denovoWhite,
          // Text on secondary (Yellow) elements is black
          onSecondary: denovoBlack,
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
      // --- ROUTING SETUP ---
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        // ✅ NEW ROUTE: The Inventory Gallery Page
        '/inventory': (context) => const InventoryPage(), 

        // Placeholder Routes for Navbar/Footer links
        '/financing': (context) => const PlaceholderPage(title: 'Financing'),
        '/contact': (context) => const PlaceholderPage(title: 'Contact'),
        '/about': (context) => const PlaceholderPage(title: 'About Us'),
        '/careers': (context) => const PlaceholderPage(title: 'Careers'),
        '/faq': (context) => const PlaceholderPage(title: 'FAQ'),
        '/warranty': (context) => const PlaceholderPage(title: 'Warranty'),
        '/service': (context) => const PlaceholderPage(title: 'Service & Parts'),
        '/privacy': (context) => const PlaceholderPage(title: 'Privacy Policy'),
      },
    );
  }
}