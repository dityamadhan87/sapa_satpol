import 'package:first_flutter/LoginSection/Login.dart';
import 'package:first_flutter/MainNav.dart';
import 'package:first_flutter/OnBoardingScreen/OnboardingScreen.dart';
import 'package:first_flutter/RegisterSection/Register.dart';
import 'package:first_flutter/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAPA SATPOL',
      initialRoute: '/home',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBoardingScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainNav(),
      },
      debugShowCheckedModeBanner: false
    );
  }
}