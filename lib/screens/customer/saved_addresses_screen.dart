// lib/screens/customer/saved_addresses_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AddressModel {
  String id;
  String label; // Rumah, Kantor, Kosan
  String receiverName;
  String phoneNumber;
  String details;
  bool isPrimary;

  AddressModel({
    required this.id,
    required this.label,
    required this.receiverName,
    required this.phoneNumber,
    required this.details,
    this.isPrimary = false,
  });
}

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  // Data mockup alamat sementara (Bisa ditambah/hapus di UI)
  final List<AddressModel> _addresses = [
    AddressModel(
      id: '1',
      label: 'Rumah',
      receiverName: 'Budi Santoso',
      phoneNumber: '081234567890',
      details:
          'Jl. Merdeka No. 10, RT 02/RW 05, Blok C1 (Pagar Hitam Samping Laundry)',
      isPrimary: true,
    ),
    AddressModel(
      id: '2',
      label: 'Kantor / Tempat Kerja',
      receiverName: 'Budi Santoso (Tech Dept)',
      phoneNumber: '081234567890',
      details: 'Gedung Cyber Jaya, Lt. 5, Jl. Gatot Subroto No. 12',
      isPrimary: false,
    ),
  ];

  // Controller buat form tambah alamat
  final _labelController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _detailsController = TextEditingController();

  // Fungsi buat set alamat utama
  void _setAsPrimary(String id) {
    setState(() {
      for (var address in _addresses) {
        address.isPrimary = (address.id == id);
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Alamat utama berhasil diubah!')),
    );
  }

  // Fungsi buat hapus alamat
  void _deleteAddress(String id) {
    setState(() {
      _addresses.removeWhere((address) => address.id == id);
    });
  }

  // Tampilkan form modal bottom sheet untuk tambah alamat baru
  void _showAddAddressSheet() {
    // Reset form field dulu
    _labelController.clear();
    _nameController.clear();
    _phoneController.clear();
    _detailsController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambah Alamat Baru',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkGreenText,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _labelController,
                decoration: const InputDecoration(
                  labelText: 'Label Alamat (Contoh: Rumah, Kosan)',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama Penerima'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _detailsController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Alamat Lengkap & Patokan',
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_labelController.text.isEmpty ||
                        _detailsController.text.isEmpty)
                      return;

                    setState(() {
                      _addresses.add(
                        AddressModel(
                          id: DateTime.now().toString(),
                          label: _labelController.text,
                          receiverName: _nameController.text,
                          phoneNumber: _phoneController.text,
                          details: _detailsController.text,
                          isPrimary: _addresses
                              .isEmpty, // Auto-primary kalau list kosong
                        ),
                      );
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.darkGreenText,
                    foregroundColor: AppTheme.creamyBackground,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Simpan Alamat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _labelController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreenText,
        iconTheme: const IconThemeData(color: AppTheme.creamyBackground),
        title: const Text(
          'Alamat Tersimpan',
          style: TextStyle(color: AppTheme.creamyBackground),
        ),
        centerTitle: true,
      ),
      body: _addresses.isEmpty
          ? const Center(child: Text('Belum ada alamat tersimpan.'))
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                final address = _addresses[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: address.isPrimary
                          ? AppTheme.darkGreenText
                          : Colors.grey.shade200,
                      width: address.isPrimary ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                address.label.toLowerCase().contains('rumah')
                                    ? Icons.home_outlined
                                    : Icons.business_outlined,
                                color: AppTheme.darkGreenText,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                address.label,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          if (address.isPrimary)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.darkGreenText.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Utama',
                                style: TextStyle(
                                  color: AppTheme.darkGreenText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const Divider(height: 20),
                      Text(
                        '${address.receiverName} | ${address.phoneNumber}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        address.details,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!address.isPrimary) ...[
                            TextButton(
                              onPressed: () => _deleteAddress(address.id),
                              child: const Text(
                                'Hapus',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => _setAsPrimary(address.id),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.darkGreenText,
                                foregroundColor: AppTheme.creamyBackground,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Jadikan Utama'),
                            ),
                          ] else
                            const Text(
                              'Alamat Pengiriman Aktif',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton.icon(
            onPressed: _showAddAddressSheet,
            icon: const Icon(Icons.add),
            label: const Text(
              'Tambah Alamat Baru',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.darkGreenText,
              foregroundColor: AppTheme.creamyBackground,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
