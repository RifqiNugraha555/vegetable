// lib/screens/auth/login_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';

// Import semua halaman beranda (termasuk Admin sekarang)
import '../customer/customer_home_screen.dart';
import '../driver/driver_home_screen.dart';
import '../seller/seller_main_screen.dart';
import '../admin/admin_store_list_screen.dart'; // <-- Import Admin ditambahkan

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk membaca teks yang diketik user
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi Deteksi Role
  void _loginAndRoute() {
    String email = _emailController.text.toLowerCase().trim();

    // Logika Routing Berdasarkan Email (Satu Pintu untuk Semua)
    if (email.contains('admin')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminStoreListScreen()),
      );
    } else if (email.contains('driver')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DriverHomeScreen()),
      );
    } else if (email.contains('toko') || email.contains('seller')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SellerMainScreen()),
      );
    } else if (email.contains('customer') || email.contains('user')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CustomerHomeScreen()),
      );
    } else {
      // Jika email tidak sesuai, tampilkan pesan error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Gagal'),
          content: const Text('Email tidak dikenali. Silakan coba lagi.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkGreenText,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo atau Icon Aplikasi
                const Icon(
                  Icons.shopping_basket,
                  size: 80,
                  color: AppTheme.creamyBackground,
                ),
                const SizedBox(height: 16),
                const Text(
                  'SayurApp',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.creamyBackground,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Masuk untuk mulai bertransaksi',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 48),

                // Kolom Input Email
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText:
                        'Email (contoh: admin@gmail.com)', // Hint disesuaikan
                    filled: true,
                    fillColor: AppTheme.creamyBackground,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: AppTheme.darkGreenText,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Kolom Input Password
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: AppTheme.creamyBackground,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppTheme.darkGreenText,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Tombol Login
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'L O G I N',
                    backgroundColor: AppTheme.creamyBackground,
                    textColor: AppTheme.darkGreenText,
                    onPressed: _loginAndRoute,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
