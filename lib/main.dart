import 'package:flutter/material.dart';
import 'package:biopharm/login_screen.dart';
import 'package:biopharm/home_screen.dart';
import 'package:biopharm/landing_page.dart';
import 'package:biopharm/aboutus_screen.dart';

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
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => const LandingPage(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/aboutus': (context) => const AboutUsPage(),
      },
    );
  }
}
