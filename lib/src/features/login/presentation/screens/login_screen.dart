import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routePath = '/login_route_path';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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