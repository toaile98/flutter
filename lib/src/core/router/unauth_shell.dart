import 'package:flutter/material.dart';

class UnauthShell extends StatelessWidget {
  const UnauthShell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}
