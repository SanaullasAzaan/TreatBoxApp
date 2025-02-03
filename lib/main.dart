import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treatboxrefurbisshed/screens/login_screen.dart';
import 'package:treatboxrefurbisshed/screens/register_screen.dart';
import 'screens/splash_screen.dart'; // Import the splash screen


void main() {
  debugPrint(FontLoader('Exo2').toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      title: 'TreatBox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Set SplashScreen as the initial screen
      debugShowCheckedModeBanner: false, // Removes the debug banner
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
