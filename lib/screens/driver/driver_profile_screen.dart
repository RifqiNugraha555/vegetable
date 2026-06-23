// lib/screens/driver/driver_profile_screen.dart

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../theme/app_theme.dart';
import '../auth/login_screen.dart'; // Import halaman login lu

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  final _user = Supabase.instance.client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.darkGreenText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profil Driver',
          style: TextStyle(
            color: AppTheme.darkGreenText,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // --- FOTO PROFIL & NAMA DRIVER ---
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.darkGreenText.withOpacity(0.1),
                    child: const Icon(
                      Icons.delivery_dining,
                      size: 50,
                      color: AppTheme.darkGreenText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Bang Jon Kurir',
                    style: TextStyle(
                      color: AppTheme.darkGreenText,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _user?.email ?? 'driver.vegetables@email.com',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // --- INFO KENDARAAN DRIVER ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Kendaraan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkGreenText,
                    ),
                  ),
                  const Divider(height: 20),
                  _buildInfoRow(
                    Icons.motorcycle,
                    'Sepeda Motor',
                    'Honda Beat (Hitam)',
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.badge, 'Nomor Polisi', 'D 1234 ABC'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // --- MENU PENGATURAN ---
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildMenuTile(
                    icon: Icons.history,
                    title: 'Riwayat Pengantaran',
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey.shade100),
                  _buildMenuTile(
                    icon: Icons.settings,
                    title: 'Pengaturan Aplikasi',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

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
                  // Proses Sign Out Supabase
                  await Supabase.instance.client.auth.signOut();

                  // Nendang balik ke Login Screen & hapus history page
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget buat baris info kendaraan
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600, size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  // Helper Widget buat baris menu
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
