// lib/main.dart

import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/auth/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Supabase global instance
  await Supabase.initialize(
    url: 'https://eugntxrthpjurbauotaz.supabase.co',
    anonKey: 'sb_publishable_SfFrCr5-KjLf_R2MDhDomw_bPin_BVH',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vegetables App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  Future<List<Map<String, dynamic>>> _fetchData() async {
    final response = await Supabase.instance.client.from('product').select();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Koneksi Supabase'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Eror nih bro: ${snapshot.error}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(
              child: Text('Koneksi Sukses! Tapi isi tabel lu masih kosong.'),
            );
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.green),
                title: Text(item['name'] ?? 'Kolom name tidak ditemukan'),
                subtitle: Text('Rp ${item['price'] ?? 0}'),
              );
            },
          );
        },
      ),
    );
  }
}
