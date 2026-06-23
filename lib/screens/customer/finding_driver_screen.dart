// lib/screens/customer/finding_driver_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'customer_home_screen.dart';

class FindingDriverScreen extends StatefulWidget {
  const FindingDriverScreen({super.key});

  @override
  State<FindingDriverScreen> createState() => _FindingDriverScreenState();
}

class _FindingDriverScreenState extends State<FindingDriverScreen> {
  bool _isDriverFound = false;
  String _statusText = "Mencari Driver Terdekat...";

  @override
  void initState() {
    super.initState(); // <-- TYPO NYA UDAH DIBERESIN DI SINI

    // Simulasi nunggu pencarian driver selama 3 detik
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isDriverFound = true;
          _statusText = "Driver Sedang Menuju ke Toko";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: Stack(
        children: [
          // --- AREA MAPS (GPS LIVE PLACEHOLDER) ---
          Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, size: 100, color: Colors.black38),
                  SizedBox(height: 10),
                  Text(
                    'Peta GPS Tracking (Full Screen)',
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- TOMBOL KEMBALI KE HOME (Pojok Kiri Atas) ---
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: AppTheme.darkGreenText,
              child: IconButton(
                icon: const Icon(Icons.close, color: AppTheme.creamyBackground),
                onPressed: () {
                  // Langsung balik ke Beranda Utama
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerHomeScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ),

          // --- BOTTOM SHEET STATUS DRIVER (Responsif & Interaktif) ---
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Indikator Loading / Status Berhasil
                    Row(
                      children: [
                        if (!_isDriverFound)
                          const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: AppTheme.darkGreenText,
                              strokeWidth: 3,
                            ),
                          )
                        else
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 28,
                          ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            _statusText,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkGreenText,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Divider(height: 32, thickness: 1),

                    // TAMPILAN DETAIL JIKA DRIVER DITEMUKAN
                    if (_isDriverFound) ...[
                      Row(
                        children: [
                          // Foto Driver Dummy
                          const CircleAvatar(
                            radius: 25,
                            backgroundColor: AppTheme.darkGreenText,
                            child: Icon(
                              Icons.person,
                              color: AppTheme.creamyBackground,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Info Driver & Kendaraan (Plat Nomor)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Agus Kopling',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Honda Vario • D 1234 ABC',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Tombol Telpon / Chat Dummy
                          CircleAvatar(
                            backgroundColor: Colors.green.shade50,
                            child: const Icon(Icons.phone, color: Colors.green),
                          ),
                        ],
                      ),
                    ] else ...[
                      // Tampilan Menunggu Driver
                      Text(
                        'Sistem sedang mencarikan Driver terbaik di sekitar Buah Batu untuk mengantar sayuranmu.',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
