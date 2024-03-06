import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:gp2/src/features/authentication/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Your splash screen image
                Image.asset(
                  'assets/images/top_of_splash.png',
                  height: 500.0,
                  width: double.infinity,
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
    // AnimatedSplashScreen(
    //   splash: 'assets/images/Untitled-1-01.png',
    //   nextScreen: LoginScreen(),
    //   splashTransition: SplashTransition.rotationTransition,
    // );
  }
}
