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

      // Balikin ke SplashScreen di sini biar alurnya normal lagi
      home: const SplashScreen(),
    );
  }
}

// =========================================================================
// WIDGET TAMBAHAN DI BAWAH INI CUMA BUAT NGETES AMBIL DATA DARI SUPABASE LU
// =========================================================================
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Fungsi untuk mengambil data dari database
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
          // 1. Kondisi pas aplikasi lagi loading nyari data ke internet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Kondisi kalau eror (misal: RLS belum dimatiin, atau nama tabel salah)
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

          // 3. Kondisi kalau koneksi sukses, tapi isi tabel di Supabase lu emang masih kosong
          if (data.isEmpty) {
            return const Center(
              child: Text(
                'Koneksi Sukses! Tapi isi tabel lu masih kosong, coba isi row dulu di dashboard.',
              ),
            );
          }

          // 4. Kondisi kalau data berhasil diambil dan ada isinya
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
