// lib/core/widgets/custom_button.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor; // Tambahan opsi warna background
  final Color? textColor; // Tambahan opsi warna teks

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240, // Lebar dibikin fix biar konsisten kayak di mockup
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // Kalau warna custom diisi, pake itu. Kalau kosong, pake warna default tema
          backgroundColor: backgroundColor ?? AppTheme.lightGreenButton,
          foregroundColor: textColor ?? AppTheme.darkGreenText,
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 6.0, // Jarak antar huruf D R I V E R
          ),
        ),
      ),
    );
  }
}
