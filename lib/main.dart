import 'package:flutter/material.dart';
import 'package:biopharm/login_screen.dart';
import 'package:biopharm/home_screen.dart';

void main() {
  runApp(const BioPharmApp());
}

class BioPharmApp extends StatelessWidget {
  const BioPharmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioPharm', // The title of the application, used by the OS and other systems.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Primary color for the application’s theme.
      ),
      initialRoute: '/login', // The route to be displayed initially when the app starts.
      routes: {
        '/login': (context) => LoginScreen(), // Route for the login screen.
        '/home': (context) => const HomeScreen(), // Route for the home screen.
      },
    );
  }
}
