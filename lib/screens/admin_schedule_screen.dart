import 'package:flutter/material.dart';

class AdminScheduleScreen extends StatelessWidget {
  const AdminScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuruPiket',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Beranda > Jadwal',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Jadwal Mengajar\nSemester Genap TA 2024/2025',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Tombol Aksi Sesuai Wireframe Page 5
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Tambah Jadwal',
                        style: TextStyle(fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('Validasi Otomatis',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue.shade700,
                      side: BorderSide(color: Colors.blue.shade700, width: 2),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // List Jadwal
            _buildScheduleCard('10 MIPA 1', 'Matematika', 'Budi Santoso',
                'Senin, 08:00 - 09:30 WIB'),
            _buildScheduleCard('11 IPS 2', 'Bahasa Indonesia', 'Siti Aminah',
                'Senin, 10:00 - 11:30 WIB'),
            _buildScheduleCard('12 MIPA 3', 'Informatika', 'Ahmad Dahlan',
                'Selasa, 08:00 - 09:30 WIB'),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleCard(
      String kelas, String subject, String teacher, String time) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text('$kelas - $subject',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Guru: $teacher',
                  style: const TextStyle(color: Colors.black87)),
              const SizedBox(height: 4),
              Text('Waktu: $time', style: const TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        trailing: const Icon(Icons.edit_calendar, color: Colors.grey),
        isThreeLine: true,
      ),
    );
  }
}
