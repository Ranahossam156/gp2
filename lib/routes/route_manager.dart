import 'package:flutter/material.dart';
import 'package:gp2/src/features/authentication/screens/forget_password_otp.dart';
import 'package:gp2/src/features/authentication/screens/login_screen.dart';
import 'package:gp2/src/features/authentication/screens/signup_screen.dart';

class RouteManager {
  static const String loadingPage = '/';
  static const String loginPage = '/loginScreen';
  static const String registerPage = '/registerScreen';
  static const String otpPage = '/OTPScreen';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case loadingPage:
      //   return MaterialPageRoute(builder: (context) => const SplashView());
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case registerPage:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case otpPage:
        return MaterialPageRoute(builder: (context) => OTPScreen());
      default:
        throw Exception("No route found!");
    }
  }
}
