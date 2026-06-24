// lib/screens/admin/admin_store_list_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../auth/login_screen.dart';

class AdminStoreListScreen extends StatefulWidget {
  const AdminStoreListScreen({super.key});

  @override
  State<AdminStoreListScreen> createState() => _AdminStoreListScreenState();
}

class _AdminStoreListScreenState extends State<AdminStoreListScreen> {
  List<Map<String, dynamic>> stores = [
    {
      "name": "Warung Sayur Mang Ujang",
      "owner": "Bapak Ujang",
      "isActive": true,
    },
    {"name": "Toko Sayur Segar Bu Imah", "owner": "Ibu Imah", "isActive": true},
    {"name": "Sayur Maju Jaya", "owner": "Asep Knalpot", "isActive": false},
    {"name": "Sayur Organik Lembang", "owner": "Teh Nisa", "isActive": true},
  ];

  @override
  Widget build(BuildContext context) {
    int activeStores = stores.where((s) => s["isActive"] == true).length;
    int blockedStores = stores.length - activeStores;

    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreenText,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: AppTheme.creamyBackground),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            tooltip: 'Logout Admin',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    title: 'Toko Aktif',
                    count: activeStores.toString(),
                    color: Colors.green,
                    icon: Icons.check_circle,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSummaryCard(
                    title: 'Toko Diblokir',
                    count: blockedStores.toString(),
                    color: Colors.red,
                    icon: Icons.block,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              'Manajemen Toko Sayur',
              style: TextStyle(
                color: AppTheme.darkGreenText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  final store = stores[index];
                  bool isActive = store["isActive"];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isActive
                            ? Colors.grey.shade300
                            : Colors.red.shade200,
                        width: isActive ? 1 : 2,
                      ),
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
                        CircleAvatar(
                          backgroundColor: isActive
                              ? AppTheme.darkGreenText.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                          radius: 24,
                          child: Icon(
                            Icons.store,
                            color: isActive
                                ? AppTheme.darkGreenText
                                : Colors.red,
                          ),
                        ),
                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store["name"],
                                style: TextStyle(
                                  color: isActive
                                      ? AppTheme.darkGreenText
                                      : Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: isActive
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Pemilik: ${store["owner"]}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              stores[index]["isActive"] = !isActive;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isActive
                                ? Colors.red.shade50
                                : Colors.green.shade50,
                            foregroundColor: isActive
                                ? Colors.red
                                : Colors.green,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            isActive ? 'Blokir' : 'Pulihkan',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String count,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
