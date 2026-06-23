// lib/screens/customer/store_detail_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import 'checkout_screen.dart';

class StoreDetailScreen extends StatefulWidget {
  final String storeName;

  const StoreDetailScreen({super.key, required this.storeName});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  // Dummy data sayuran yang dijual
  final List<Map<String, dynamic>> products = [
    {"name": "Kangkung Segar", "price": 3000, "unit": "Ikat", "qty": 0},
    {"name": "Bayam Hijau", "price": 2500, "unit": "Ikat", "qty": 0},
    {"name": "Wortel Impor", "price": 12000, "unit": "Kg", "qty": 0},
    {"name": "Tomat Merah", "price": 8000, "unit": "Kg", "qty": 0},
  ];

  int getTotalPrice() {
    int total = 0;
    for (var product in products) {
      total += (product["price"] as int) * (product["qty"] as int);
    }
    return total;
  }

  int getTotalItems() {
    int total = 0;
    for (var product in products) {
      total += (product["qty"] as int);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = getTotalPrice();
    int totalItems = getTotalItems();

    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreenText,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.creamyBackground),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.storeName,
          style: const TextStyle(color: AppTheme.creamyBackground),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Placeholder Foto Sayur
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppTheme.darkGreenText.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.eco,
                    color: AppTheme.darkGreenText,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),

                // Info Sayur
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product["name"],
                        style: const TextStyle(
                          color: AppTheme.darkGreenText,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Rp ${product["price"]} / ${product["unit"]}",
                        style: const TextStyle(
                          color: Colors.orange, // Bikin harga mencolok
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Tombol Plus Minus
                Row(
                  children: [
                    if (product["qty"] > 0) ...[
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            product["qty"]--;
                          });
                        },
                      ),
                      Text(
                        '${product["qty"]}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        color: AppTheme.darkGreenText,
                      ),
                      onPressed: () {
                        setState(() {
                          product["qty"]++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),

      // --- BOTTOM CART BAR ---
      bottomNavigationBar: totalItems > 0
          ? SafeArea(
              // <-- Tambahan SafeArea biar gak nabrak bagian bawah HP
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color:
                      AppTheme.creamyBackground, // Biar nyatu sama background
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // --- AREA HARGA (Diberi Expanded biar ngedorong tombol ke kanan) ---
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$totalItems Item',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Rp $totalPrice',
                            style: const TextStyle(
                              color: AppTheme.darkGreenText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            // Biar kalau harganya sampai jutaan gak bikin layout rusak
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      width: 16,
                    ), 
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.darkGreenText,
                          foregroundColor: AppTheme.creamyBackground,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ), // Hilangkan padding horizontal bawaan
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              25,
                            ), // Sesuaikan kelengkungan tombol lu
                          ),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing:
                                0, // Pastikan tidak ada spasi ekstra antar huruf
                          ),
                          maxLines: 1, // Paksa cuma 1 baris
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(), // Kalau keranjang kosong, hilangin bar-nya keranjang kosong, hilangin bar-nya
    );
  }
}
