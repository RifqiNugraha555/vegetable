// lib/screens/auth/otp_verification_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkGreenText,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.creamyBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: AppTheme.darkGreenText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  'Verifikasi OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.creamyBackground,
                  ),
                ),

                const SizedBox(height: 80),

                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: AppTheme.creamyBackground,
                    fontSize: 16,
                    letterSpacing: 2.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Masukkan  OTP',
                    hintStyle: TextStyle(
                      color: AppTheme.creamyBackground.withOpacity(0.8),
                      letterSpacing: 0,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppTheme.creamyBackground,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppTheme.creamyBackground,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Masukkan Kode OTP yang di Kirimkan Ke\nemail asjbfhahsf***@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.creamyBackground,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 120),

                CustomButton(
                  text: 'D a f t a r',
                  backgroundColor: AppTheme.creamyBackground,
                  textColor: AppTheme.darkGreenText,
                  onPressed: () {
                    print("Pendaftaran Berhasil! Lanjut ke Home atau Login.");
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
