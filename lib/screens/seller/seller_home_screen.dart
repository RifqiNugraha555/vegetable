// lib/screens/seller/seller_home_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  bool _isStoreOpen = true;

  // Dummy data list sayuran milik toko
  final List<Map<String, dynamic>> myProducts = [
    {"name": "Kangkung Segar", "price": 3000, "unit": "Ikat", "stock": true},
    {"name": "Bayam Hijau", "price": 2500, "unit": "Ikat", "stock": true},
    {"name": "Wortel Impor", "price": 12000, "unit": "Kg", "stock": false},
    {"name": "Tomat Merah", "price": 8000, "unit": "Kg", "stock": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER: NAMA TOKO & STATUS BUKA/TUTUP ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selamat Datang,',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const Text(
                        'Warung Mang Ujang',
                        style: TextStyle(
                          color: AppTheme.darkGreenText,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Switch Buka/Tutup Toko
                  Column(
                    children: [
                      Text(
                        _isStoreOpen ? 'TOKO BUKA' : 'TOKO TUTUP',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: _isStoreOpen ? Colors.green : Colors.red,
                        ),
                      ),
                      Switch(
                        value: _isStoreOpen,
                        onChanged: (value) {
                          setState(() {
                            _isStoreOpen = value;
                          });
                        },
                        activeColor: AppTheme.darkGreenText,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // --- RINGKASAN BISNIS HARI INI (Dua Kolom) ---
              Row(
                children: [
                  // Box Pendapatan
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.darkGreenText,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: AppTheme.creamyBackground,
                            size: 28,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Pendapatan',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Rp 450.000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Box Pesanan Sukses
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: AppTheme.darkGreenText,
                            size: 28,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Pesanan Sukses',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '15 Pesanan',
                            style: TextStyle(
                              color: AppTheme.darkGreenText,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // --- ANTREAN PESANAN BARU ---
              const Text(
                'Perlu Disiapkan',
                style: TextStyle(
                  color: AppTheme.darkGreenText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade300),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.hourglass_top,
                      color: Colors.amber,
                      size: 30,
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order #ID-98721',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '1x Kangkung, 2x Tomat Merah',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Pesanan selesai disiapkan oleh toko!");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.darkGreenText,
                        foregroundColor: AppTheme.creamyBackground,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Siap!',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // --- DAFTAR KATALOG & STOK SAYUR ---
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kelola Stok Produk',
                    style: TextStyle(
                      color: AppTheme.darkGreenText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Status Stok',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // List Builder untuk Produk Toko
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myProducts.length,
                itemBuilder: (context, index) {
                  final product = myProducts[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppTheme.darkGreenText.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.eco,
                            color: AppTheme.darkGreenText,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["name"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Rp ${product["price"]} / ${product["unit"]}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Switch Switch ketersediaan stok
                        Switch(
                          value: product["stock"],
                          onChanged: (bool value) {
                            setState(() {
                              product["stock"] = value;
                            });
                          },
                          activeColor: AppTheme.darkGreenText,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // Tombol Mengambang buat Tambah Sayur Baru
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("Membuka form tambah produk");
        },
        backgroundColor: AppTheme.darkGreenText,
        foregroundColor: AppTheme.creamyBackground,
        icon: const Icon(Icons.add),
        label: const Text(
          'Tambah Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
