import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routePath = '/splash_route_path';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Example navigation
          },
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}