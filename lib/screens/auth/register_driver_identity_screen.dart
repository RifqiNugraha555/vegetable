// lib/screens/auth/register_driver_identity_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import 'register_driver_vehicle_screen.dart';

class RegisterDriverIdentityScreen extends StatelessWidget {
  const RegisterDriverIdentityScreen({super.key});

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
                  'Identitas\nDriver',
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
                  label: 'Nama Asli',
                  hintText: 'Masukkan Nama Asli',
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'Nomor Induk KTP',
                  hintText: 'Masukkan NIK',
                ),
                const SizedBox(height: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Foto KTP',
                      style: TextStyle(
                        color: AppTheme.creamyBackground,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {
                        print("Buka Kamera / Galeri HP");
                      },
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.creamyBackground,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppTheme.creamyBackground.withOpacity(0.6),
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                            const RegisterDriverVehicleScreen(),
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
