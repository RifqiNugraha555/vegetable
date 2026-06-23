// lib/screens/auth/register_store_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import 'otp_verification_screen.dart';

class RegisterStoreScreen extends StatelessWidget {
  const RegisterStoreScreen({super.key});

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
                // --- TOMBOL BACK ---
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

                // --- JUDUL HALAMAN ---
                const Text(
                  'Identitas\nToko',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.creamyBackground,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 40),

                // --- FORM INPUT FIELDS ---
                const CustomTextField(
                  label: 'Nama Toko',
                  hintText: 'Masukkan Nama Toko',
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'Alamat',
                  hintText: 'Masukkan Alamat',
                ),
                const SizedBox(height: 16),

                // Form Deskripsi yang lebih tinggi
                const CustomTextField(
                  label: 'Deskripsi Toko',
                  hintText: '',
                  maxLines: 4, // Bikin kotaknya besar ke bawah
                ),
                const SizedBox(height: 16),

                // --- KOTAK UPLOAD FOTO TOKO ---
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Foto Toko',
                      style: TextStyle(
                        color: AppTheme.creamyBackground,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {
                        // Nanti diisi logika untuk buka galeri foto
                        print("Buka Galeri HP");
                      },
                      child: Container(
                        height: 120, // Tinggi kotak foto
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.creamyBackground,
                            width: 1,
                          ),
                        ),
                        // Nanti gambar yang dipilih akan ditampilin di dalam sini
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // --- TOMBOL NEXT ---
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
