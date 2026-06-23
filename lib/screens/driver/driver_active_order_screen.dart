// lib/screens/driver/driver_active_order_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class DriverActiveOrderScreen extends StatefulWidget {
  const DriverActiveOrderScreen({super.key});

  @override
  State<DriverActiveOrderScreen> createState() =>
      _DriverActiveOrderScreenState();
}

class _DriverActiveOrderScreenState extends State<DriverActiveOrderScreen> {
  // Status: 0 = Menuju Toko, 1 = Menuju Customer
  int _orderStatus = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: Stack(
        children: [
          // --- AREA PETA (MAPS PLACEHOLDER) ---
          Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.navigation, size: 80, color: Colors.blueAccent),
                  SizedBox(height: 10),
                  Text(
                    'Peta Navigasi Live',
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- HEADER: STATUS NAVIGASI ---
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.darkGreenText,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.directions_bike,
                      color: AppTheme.creamyBackground,
                      size: 28,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _orderStatus == 0
                                ? 'Menuju Tempat Pengambilan'
                                : 'Mengantar ke Customer',
                            style: TextStyle(
                              color: AppTheme.creamyBackground.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _orderStatus == 0
                                ? 'Warung Sayur Mang Ujang'
                                : 'Jl. Merdeka No. 10',
                            style: const TextStyle(
                              color: AppTheme.creamyBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // --- BOTTOM SHEET: DETAIL ORDER & TOMBOL ---
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info Customer & Kontak
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppTheme.darkGreenText,
                          child: Icon(
                            Icons.person,
                            color: AppTheme.creamyBackground,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Budi Santoso',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Pembayaran: Tunai (Rp 31.000)',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue.shade50,
                              child: const Icon(
                                Icons.chat,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.green.shade50,
                              child: const Icon(
                                Icons.phone,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Divider(height: 32, thickness: 1),

                    // Daftar Pesanan (Biar driver tau mau ngambil apa)
                    const Text(
                      'Detail Pesanan:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '• 1x Kangkung Segar',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Text(
                      '• 2x Tomat Merah',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),

                    const SizedBox(height: 24),

                    // TOMBOL AKSI UTAMA
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_orderStatus == 0) {
                            // Ubah status jadi mengantar ke customer
                            setState(() {
                              _orderStatus = 1;
                            });
                          } else {
                            // Selesaikan order
                            print("Order Selesai!");
                            Navigator.pop(context); // Kembali ke Beranda Driver
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _orderStatus == 0
                              ? Colors.orange
                              : AppTheme.darkGreenText,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _orderStatus == 0
                              ? 'SAYA SUDAH AMBIL BARANG'
                              : 'PESANAN SELESAI DIANTAR',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
