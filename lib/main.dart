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
      title: 'BioPharm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
