import 'package:flutter/material.dart';
import 'package:flutter_base/src/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routePath = '/home_route_path';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(AuthEvent.logout());
            // Example navigation
          },
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}
