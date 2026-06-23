// lib/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Warna-warna dari mockup image_6.png
  static const Color creamyBackground = Color(
    0xFFF4F0E1,
  ); // Warna cream latar belakang
  static const Color lightGreenButton = Color(
    0xFFA5CFA1,
  ); // Warna hijau muda tombol capsule
  static const Color darkGreenText = Color(
    0xFF2E6F40,
  ); // Warna hijau tua teks "LOGIN"

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor:
          creamyBackground, // Set background default cream penuh
      // Set font global pake Poppins biar mirip desain
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}
