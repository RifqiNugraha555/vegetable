// lib/screens/customer/customer_home_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'store_detail_screen.dart';
import 'profile_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;

  // Data dummy warung sayur terdekat
  final List<Map<String, String>> nearbyStores = [
    {
      "name": "Warung Sayur Mang Ujang",
      "distance": "0.5 km",
      "address": "Jl. Buah Batu, Bandung",
    },
    {
      "name": "Toko Sayur Segar Bu Imah",
      "distance": "1.2 km",
      "address": "Jl. Kiaracondong, Bandung",
    },
    {
      "name": "Sayur Maju Jaya",
      "distance": "2.0 km",
      "address": "Jl. Dipatiukur, Bandung",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // List halaman yang bakal ditampilin berdasarkan tab yang dipilih
    final List<Widget> pages = [
      _buildHomeContent(context), // Index 0: Beranda
      const Center(
        child: Text("Halaman Pesanan (Nanti)"),
      ), // Index 1: Pesanan (Kosong dulu)
      const ProfileScreen(), // Index 2: Profil
    ];

    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      // IndexedStack bikin layar ganti-ganti tanpa kehilangan state
      body: IndexedStack(index: _selectedIndex, children: pages),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: AppTheme.darkGreenText,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  // --- INI ISI BERANDA YANG SEBELUMNYA ADA DI DALAM 'body' ---
  Widget _buildHomeContent(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lokasi Pengiriman',
                      style: TextStyle(
                        color: AppTheme.darkGreenText.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppTheme.darkGreenText,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Jl. Merdeka No. 10, Bandung',
                          style: TextStyle(
                            color: AppTheme.darkGreenText,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppTheme.darkGreenText,
                        ),
                      ],
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: AppTheme.darkGreenText,
                  child: Icon(Icons.person, color: AppTheme.creamyBackground),
                ),
              ],
            ),
          ),

          // Maps Placeholder
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.darkGreenText, width: 2),
            ),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.map_outlined, size: 80, color: Colors.grey),
                Positioned(
                  bottom: 20,
                  child: Text(
                    'Peta Live GPS Akan Tampil di Sini',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Warung Sayur Terdekat',
              style: TextStyle(
                color: AppTheme.darkGreenText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // List Warung
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: nearbyStores.length,
              itemBuilder: (context, index) {
                final store = nearbyStores[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StoreDetailScreen(storeName: store["name"]!),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
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
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: AppTheme.darkGreenText.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.storefront,
                            color: AppTheme.darkGreenText,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store["name"]!,
                                style: const TextStyle(
                                  color: AppTheme.darkGreenText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                store["address"]!,
                                style: TextStyle(
                                  color: AppTheme.darkGreenText.withOpacity(
                                    0.7,
                                  ),
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.darkGreenText,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  store["distance"]!,
                                  style: const TextStyle(
                                    color: AppTheme.creamyBackground,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
