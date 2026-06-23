// lib/screens/driver/driver_home_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import 'driver_active_order_screen.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool _isOnline = false;
  bool _hasIncomingOrder = false;

  // Fungsi untuk toggle Online/Offline
  void _toggleStatus(bool value) {
    setState(() {
      _isOnline = value;
      _hasIncomingOrder = false; // Reset orderan kalau offline
    });

    // Kalau driver online, simulasi dapet orderan setelah 3 detik
    if (_isOnline) {
      Timer(const Duration(seconds: 3), () {
        if (mounted && _isOnline) {
          setState(() {
            _hasIncomingOrder = true;
          });
        }
      });
    }
  }

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 100,
                    color: _isOnline ? Colors.black38 : Colors.black12,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _isOnline ? 'Peta GPS Aktif' : 'Peta Offline',
                    style: TextStyle(
                      color: _isOnline ? Colors.black45 : Colors.black26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- HEADER: STATUS & PENDAPATAN HARI INI ---
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol Profil / Menu
                  const CircleAvatar(
                    backgroundColor: AppTheme.darkGreenText,
                    child: Icon(Icons.person, color: AppTheme.creamyBackground),
                  ),

                  // Card Pendapatan
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Rp 150.000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- TOGGLE ONLINE / OFFLINE (Di Atas Bawah Layar) ---
          if (!_hasIncomingOrder)
            Positioned(
              bottom: 40,
              left: 40,
              right: 40,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isOnline ? 'Kamu Sedang ONLINE' : 'Kamu Sedang OFFLINE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _isOnline ? AppTheme.darkGreenText : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Switch(
                      value: _isOnline,
                      onChanged: _toggleStatus,
                      activeColor: AppTheme.creamyBackground,
                      activeTrackColor: AppTheme.darkGreenText,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),

          // --- POPUP ORDERAN MASUK ---
          if (_hasIncomingOrder)
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
                      // Header Orderan
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Orderan Baru Masuk!',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text(
                            'Rp 10.000', // Ongkir buat driver
                            style: TextStyle(
                              color: AppTheme.darkGreenText,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 32, thickness: 1),

                      // Rute Pengantaran
                      const Row(
                        children: [
                          Icon(
                            Icons.storefront,
                            color: AppTheme.darkGreenText,
                            size: 24,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pick up',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Warung Sayur Mang Ujang',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Garis putus-putus bisa pakai icon
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),

                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                            size: 24,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Drop off',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Jl. Merdeka No. 10 (2.5 km)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Tombol Terima / Tolak
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  _hasIncomingOrder = false; // Abaikan orderan
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(color: Colors.red),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text(
                                'Abaikan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {
                                // Pindah ke layar Order Aktif
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DriverActiveOrderScreen(),
                                  ),
                                );

                                // Opsional: Sembunyiin popup orderan setelah diterima
                                setState(() {
                                  _hasIncomingOrder = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.darkGreenText,
                                foregroundColor: AppTheme.creamyBackground,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text(
                                'TERIMA',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
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
