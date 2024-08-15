import 'package:delivery_app/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// Provide ThemeData object which is used to establish consistent visual style
final theme = ThemeData(
  //use useMaterial3 for app visual design
  useMaterial3: true,
  // create color Scheme based on a seed color
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    //seedColor is the based color main
    seedColor: const Color(0xFF1E201E),
    // These are the pre-defined color roles taht defin the primary , secondary etc colors
    primary: const Color(0xFF1E201E),
    secondary: const Color(0xFF800000),
    onPrimary: const Color(0xFFF8EDE3),
    onSecondary: const Color(0xFFF8EDE3),
    background: const Color(0xFF1E201E),
    onBackground: const Color(0xFFF8EDE3),
  ),

  //customizing the bodyColor and displayColor for consistency.
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: const Color(0xFFF8EDE3),
    displayColor: const Color(0xFFF8EDE3),
  ),

// customizes the appearance of the elevated buttons with spesific backgrouns and foreground
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF800000),
      foregroundColor: const Color(0xFFF8EDE3),
    ),

    //Sets the background and foreground color for app bars.
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E201E),
    foregroundColor: Color(0xFFF8EDE3),
  ),
);

void main() {
  runApp(
    // ProviderScope to provide State management
    // it involves managing data that changes over time and update the UI
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialApp it is the root of flutter app we can access all the other
    //components and widgets provideds by flutter SDK
    return MaterialApp(
      theme: theme, // Make sure 'theme' is defined or imported
      home: HomePage(),
    );
  }
}
