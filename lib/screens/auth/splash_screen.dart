import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import 'register_role_screen.dart';
import 'login_screen.dart'; // <-- Tambahan import halaman Login

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan background krem dari tema dasar
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 3), // Dorong konten ke tengah agak ke atas
              // --- AREA LOGO ---
              Image.asset(
                'assets/images/logosayur.png',
                width: 280, // Sesuaikan lebar gambar logo sayur lu
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40), // Jarak dari logo ke tagline
              // --- AREA TAGLINE ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'pesan & antar sayur dengan mudah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const Spacer(flex: 4), // Spasi flex besar sebelum tombol bawah
              // --- AREA TOMBOL & DAFTAR ---
              CustomButton(
                text: 'LOGIN',
                onPressed: () {
                  // ---> BAGIAN INI YANG BERUBAH <---
                  // Navigasi ke halaman Login
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 25), // Jarak tombol ke teks daftar

              GestureDetector(
                onTap: () {
                  // Navigasi pindah ke halaman Register Role
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterRoleScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Custom underline biar posisinya sedikit agak ke bawah seperti mockup
                    Container(width: 50, height: 1, color: Colors.black87),
                  ],
                ),
              ),

              const Spacer(flex: 1), // Sisa ruang di paling bawah layar
            ],
          ),
        ),
      ),
    );
  }
}
