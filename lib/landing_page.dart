import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                // Wide screen layout (two columns)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left column: Logo, Title, Text
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/1.png', // Replace with your logo asset
                            height: 100,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'WELCOME TO BIOPHARM: BE THE HEALTHIEST!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Welcome to Biopharm Pharmacy, where we provide convenient access to affordable and reliable medications for all your healthcare needs.',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            icon: const Icon(Icons.login),
                            label: const Text('Login'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Right column: Illustration Image
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/illustration.png', // Replace with your illustration asset
                        height: 400,
                      ),
                    ),
                  ],
                );
              } else {
                // Narrow screen layout (single column)
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/1.png', // Replace with your logo asset
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'WELCOME TO PEAK PRO: YOUR GATEWAY TO SUCCESS!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'At Peak Pro, we believe in fostering a culture of collaboration, communication, and continuous growth. We value to continuously improve and evolve to better serve you.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 32),
                      Image.asset(
                        'assets/illustration.png', // Replace with your illustration asset
                        height: 250,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
