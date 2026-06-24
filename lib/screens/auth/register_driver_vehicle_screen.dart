// lib/screens/auth/register_driver_vehicle_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import 'otp_verification_screen.dart';

class RegisterDriverVehicleScreen extends StatelessWidget {
  const RegisterDriverVehicleScreen({super.key});

  Widget _buildUploadField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.creamyBackground,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () {
            print("Buka file explorer / galeri untuk upload $label");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.creamyBackground, width: 1),
            ),
            child: Row(
              children: [
                Text(
                  hint,
                  style: TextStyle(
                    color: AppTheme.creamyBackground.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.upload_file,
                  color: AppTheme.creamyBackground.withOpacity(0.6),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
                  'Detail\nKendaraan',
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
                  label: 'Nama Kendaraan',
                  hintText: 'Masukkan Nama Kendaraan (cth: Honda Vario)',
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'Plat Nomor',
                  hintText: 'Masukkan Plat Nomor (cth: D 1234 ABC)',
                ),
                const SizedBox(height: 16),

                _buildUploadField('Foto BPKB', 'Upload Foto BPKB'),
                const SizedBox(height: 16),

                _buildUploadField('Foto STNK', 'Upload Foto STNK'),
                const SizedBox(height: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upload Foto Motor',
                      style: TextStyle(
                        color: AppTheme.creamyBackground,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {
                        print("Buka Kamera / Galeri untuk Foto Motor");
                      },
                      child: Container(
                        height: 160,
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
                        builder: (context) => const OtpVerificationScreen(),
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
