import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.grey,  // Changed to grey since we can't use black as primarySwatch
    primaryColor: Colors.black,  // Added explicit black primary color
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
    ),
  );
}