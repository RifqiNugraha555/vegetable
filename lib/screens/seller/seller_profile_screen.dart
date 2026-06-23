// lib/screens/seller/seller_profile_screen.dart

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../theme/app_theme.dart';

// 1. IMPORT HALAMAN LOGIN LU DI SINI (Sesuaikan jalurnya jika beda)
import '../auth/login_screen.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  final _user = Supabase.instance.client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // --- FOTO PROFIL & NAMA TOKO ---
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppTheme.darkGreenText.withOpacity(0.1),
                      child: const Icon(
                        Icons.storefront,
                        size: 50,
                        color: AppTheme.darkGreenText,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Warung Mang Ujang',
                      style: TextStyle(
                        color: AppTheme.darkGreenText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _user?.email ?? 'Penjual Sayur Hidroponik',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // --- MENU PENGATURAN TOKO ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    _buildMenuTile(
                      icon: Icons.edit_note,
                      title: 'Edit Profil Toko',
                      onTap: () {},
                    ),
                    Divider(height: 1, color: Colors.grey.shade100),
                    _buildMenuTile(
                      icon: Icons.location_on_outlined,
                      title: 'Alamat Pengiriman / Toko',
                      onTap: () {},
                    ),
                    Divider(height: 1, color: Colors.grey.shade100),
                    _buildMenuTile(
                      icon: Icons.notifications_none,
                      title: 'Pengaturan Notifikasi',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // --- TOMBOL LOGOUT ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: _buildMenuTile(
                  icon: Icons.logout,
                  title: 'Keluar Akun',
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () async {
                    // 2. Proses Sign Out dari Supabase
                    await Supabase.instance.client.auth.signOut();

                    // 3. Pindah langsung ke Halaman Login & Hapus semua tumpukan halaman di belakang
                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LoginScreen(), // 👈 Ganti dengan nama class Login lu jika berbeda
                        ),
                        (route) =>
                            false, // Parameter 'false' ini yang bertugas menghapus page history
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget buat bikin baris menu
  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = AppTheme.darkGreenText,
    Color textColor = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
