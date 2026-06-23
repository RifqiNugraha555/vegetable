// lib/screens/customer/profile_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../auth/login_screen.dart';
import 'saved_addresses_screen.dart'; // 1. IMPORT SCREEN BARU NYA DI SINI

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreenText,
        elevation: 0,
        title: const Text(
          'Profil Saya',
          style: TextStyle(color: AppTheme.creamyBackground),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // --- FOTO PROFIL & NAMA ---
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.darkGreenText,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppTheme.creamyBackground,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Budi Santoso',
                    style: TextStyle(
                      color: AppTheme.darkGreenText,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'budi.santoso@gmail.com',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '+62 812-3456-7890',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // --- MENU PROFIL (Sekarang dioper parameter fungsi onTap) ---
            _buildProfileMenu(
              Icons.location_on,
              'Alamat Tersimpan',
              onTap: () {
                // 2. NAVIGASI KE HALAMAN ALAMAT TERSIMPAN
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedAddressesScreen(),
                  ),
                );
              },
            ),
            _buildProfileMenu(
              Icons.favorite,
              'Warung Favorit',
              onTap: () {
                print("Menu Warung Favorit ditekan");
              },
            ),
            _buildProfileMenu(
              Icons.settings,
              'Pengaturan Akun',
              onTap: () {
                print("Menu Pengaturan Akun ditekan");
              },
            ),
            _buildProfileMenu(
              Icons.help_outline,
              'Pusat Bantuan',
              onTap: () {
                print("Menu Pusat Bantuan ditekan");
              },
            ),

            const SizedBox(height: 32),

            // --- TOMBOL LOGOUT ---
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Keluar (Logout)',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- REFAKTORING: Tambahin parameter VoidCallback onTap biar dinamis ---
  Widget _buildProfileMenu(
    IconData icon,
    String title, {
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: Icon(icon, color: AppTheme.darkGreenText),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
          onTap: onTap, // 👈 Pasang ke sini bro
        ),
      ),
    );
  }
}
