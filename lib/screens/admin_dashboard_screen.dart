import 'package:flutter/material.dart';
import 'admin_teachers_screen.dart';
import 'admin_schedule_screen.dart';
import 'replacement_search_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuruPiket',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.sync), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Banner (Sesuai Wireframe Page 7)
            Container(
              width: double.infinity,
              color: Colors.green.shade600,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  Icon(Icons.wifi, color: Colors.white, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Mode Terhubung - Data tersinkronisasi 08:30 WIB',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sapaan Admin (Sesuai Wireframe Page 7)
                  const Text(
                    'Selamat pagi,\nAdmin Drs. Monisca Liantari,S.H., M.H.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Beranda',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  // Menu Kelola Guru (Sesuai Wireframe Page 6: Tambah Guru Baru DAPODIK SYNC)
                  _buildAdminMenuCard(
                    context,
                    title: 'Database Pengajar & Guru Piket',
                    subtitle: 'Tambah Guru Baru / DAPODIK SYNC',
                    icon: Icons.manage_accounts,
                    color: Colors.blue.shade700,
                  ),
                  const SizedBox(height: 12),

                  // Menu Kelola Jadwal (Sesuai Wireframe Page 5: Tambah Jadwal Mengajar)
                  _buildAdminMenuCard(
                    context,
                    title: 'Manajemen Jadwal',
                    subtitle: 'Tambah Jadwal Mengajar / Validasi Otomatis',
                    icon: Icons.event_note,
                    color: Colors.orange.shade700,
                  ),
                  const SizedBox(height: 12),

                  // Menu Penugasan
                  _buildAdminMenuCard(
                    context,
                    title: 'Sistem Siaga Akademik',
                    subtitle: 'Cari Pengganti & Buat Penugasan',
                    icon: Icons.person_search,
                    color: Colors.green.shade700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminMenuCard(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required Color color}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // TODO: Navigasi ke form masing-masing
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade700)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
