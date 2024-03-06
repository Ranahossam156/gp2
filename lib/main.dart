import 'package:flutter/material.dart';
import 'package:gp2/src/features/authentication/screens/login_screen.dart';
import 'package:gp2/src/features/authentication/screens/spalsh_screen.dart';

void main() {
  runApp(const ForcastingApp());
}

class ForcastingApp extends StatelessWidget {
  const ForcastingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen() //LoginScreen(),
        );
  }
}
