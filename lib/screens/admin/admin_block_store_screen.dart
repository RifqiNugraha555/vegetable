// lib/screens/admin/admin_block_store_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';

class AdminBlockStoreScreen extends StatelessWidget {
  const AdminBlockStoreScreen({super.key});

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.creamyBackground,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.creamyBackground,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
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
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Rata kiri untuk teks detail
              children: [
                // --- TOMBOL BACK (opsional, tapi disarankan biar bisa balik) ---
                InkWell(
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

                const SizedBox(height: 30),

                // --- JUDUL ---
                const Center(
                  child: Text(
                    'Blokir Toko',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.creamyBackground,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // --- DETAIL TOKO ---
                _buildDetailItem('Nama Toko', 'Toko A'),
                _buildDetailItem(
                  'Alamat',
                  'Ahmad Yani Jl.Ahmad Yani RT/12 RW/23 No.203',
                ),
                _buildDetailItem(
                  'Deskripsi Toko',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
                ),

                // --- FOTO TOKO ---
                const Text(
                  'Foto Toko',
                  style: TextStyle(
                    color: AppTheme.creamyBackground,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppTheme.creamyBackground,
                      width: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // --- TOMBOL BLOKIR ---
                Center(
                  child: CustomButton(
                    text: 'B l o k i r',
                    backgroundColor: AppTheme.creamyBackground,
                    textColor: AppTheme.darkGreenText,
                    onPressed: () {
                      print("Toko Berhasil Diblokir!");
                      Navigator.pop(
                        context,
                      ); // Balik ke list toko setelah blokir
                    },
                  ),
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
