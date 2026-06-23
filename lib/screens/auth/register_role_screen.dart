import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import 'register_customer_screen.dart';
import 'register_seller_screen.dart';
import 'register_driver_screen.dart';

class RegisterRoleScreen extends StatelessWidget {
  const RegisterRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Timpa background-nya jadi hijau tua khusus di halaman ini
      backgroundColor: AppTheme.darkGreenText,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TOMBOL BACK
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () => Navigator.pop(
                    context,
                  ), // Perintah buat balik ke halaman sebelumnya
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
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(flex: 1), // Dorong konten ke tengah
            // --- JUDUL HALAMAN ---
            const Text(
              'Daftar\nSebagai',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppTheme.creamyBackground, // Teks warna krem
                height: 1.2, // Jarak antar baris teks
              ),
            ),

            const SizedBox(height: 60), // Jarak dari judul ke tombol
            // --- TOMBOL PILIHAN ROLE ---
            CustomButton(
              text: 'DRIVER',
              backgroundColor: AppTheme.creamyBackground,
              textColor: AppTheme.darkGreenText,
              onPressed: () {
                // Navigasi pindah ke halaman Register Driver
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterDriverScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30), // Jarak antar tombol

            CustomButton(
              text: 'CUSTOMER',
              backgroundColor: AppTheme.creamyBackground,
              textColor: AppTheme.darkGreenText,
              onPressed: () {
                // Navigasi ke halaman form regis customer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterCustomerScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            CustomButton(
              text: 'PENJUAL',
              backgroundColor: AppTheme.creamyBackground,
              textColor: AppTheme.darkGreenText,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterSellerScreen(),
                  ),
                );
              },
            ),

            const Spacer(flex: 2), // Sisa ruang di bawah
          ],
        ),
      ),
    );
  }
}
