import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gp2/src/features/authentication/screens/forcasting_screen.dart';
import 'package:gp2/src/features/authentication/screens/forget%20_password_screen.dart';
import 'package:gp2/src/features/authentication/screens/forget_password_otp.dart';
import 'package:gp2/src/features/authentication/screens/login_screen.dart';
import 'package:gp2/src/features/authentication/screens/signup_screen.dart';
import 'package:gp2/src/features/authentication/screens/spalsh_screen.dart';

void main() {
  runApp(const ForcastingApp());
}

class ForcastingApp extends StatelessWidget {
  const ForcastingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),//ForecastingScreen() //SplashScreen() //LoginScreen(),
        );
  }
}
