// lib/main.dart

import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/auth/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vegetables App',
      debugShowCheckedModeBanner: false,
      // Pake tema yang udah dibikin
      theme: AppTheme.lightTheme,
      // Buka SplashScreen (halaman awal)
      home: const SplashScreen(),
    );
  }
}
