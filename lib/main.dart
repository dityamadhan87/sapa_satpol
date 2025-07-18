import 'package:first_flutter/LaporanSection/KransosSection/KransosFormPage.dart';
import 'package:first_flutter/LoginSection/Login.dart';
import 'package:first_flutter/MainNav.dart';
import 'package:first_flutter/OnBoardingScreen/OnboardingScreen.dart';
import 'package:first_flutter/RegisterSection/LoadingOverlay.dart';
import 'package:first_flutter/RegisterSection/Register.dart';
import 'package:first_flutter/RegisterSection/SuccessfulOverlay.dart';
import 'package:first_flutter/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      // home: const Successfuloverlay(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBoardingScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainNav(),
        '/laporan/kransos': (context) => const KransosFormPage(),
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id'), // Indonesia
        Locale('en'), // Inggris
      ],
    );
  }
}