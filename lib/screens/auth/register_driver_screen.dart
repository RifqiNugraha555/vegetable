// lib/screens/auth/register_driver_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import 'register_driver_identity_screen.dart';

class RegisterDriverScreen extends StatelessWidget {
  const RegisterDriverScreen({super.key});

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

                const SizedBox(height: 20),

                const Text(
                  'Daftar\nDriver',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.creamyBackground,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 40),

                const CustomTextField(
                  label: 'Username',
                  hintText: 'Masukkan Username',
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'Email',
                  hintText: 'Masukkan Email',
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'Password',
                  hintText: 'Masukkan Password',
                  isPassword: true,
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'Konfirmasi Password',
                  hintText: 'Masukkan Ulang Password',
                  isPassword: true,
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'No Hp',
                  hintText: 'Masukkan No Hp',
                ),

                const SizedBox(height: 50),

                CustomButton(
                  text: 'N E X T',
                  backgroundColor: AppTheme.creamyBackground,
                  textColor: AppTheme.darkGreenText,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RegisterDriverIdentityScreen(),
                      ),
                    );
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
