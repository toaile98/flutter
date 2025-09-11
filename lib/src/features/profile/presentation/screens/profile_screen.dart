import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String routePath = '/profile_route_path';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
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