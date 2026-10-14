import 'package:flutter/material.dart';

class ReplacementSearchScreen extends StatelessWidget {
  const ReplacementSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Pengganti',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter Pencarian',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Hari & Sesi'),
                    items: const [
                      DropdownMenuItem(
                          value: '1', child: Text('Senin, 08:00 - 09:30')),
                    ],
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration:
                        const InputDecoration(labelText: 'Mata Pelajaran'),
                    items: const [
                      DropdownMenuItem(
                          value: 'indo', child: Text('B. Indonesia')),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Rekomendasi Guru (Tersedia)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _buildTeacherResultCard(context, 'Guru Budi, S.Pd',
                      'Bahasa Indonesia', '100% Cocok'),
                  _buildTeacherResultCard(context, 'Siti Aminah, M.Pd',
                      'Sejarah', 'Tersedia di jam ini'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherResultCard(
      BuildContext context, String name, String mapel, String match) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$mapel\n$match',
            style: TextStyle(color: Colors.grey.shade700)),
        isThreeLine: true,
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(80, 36),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Tugas piket berhasil dikirim ke $name!'),
                  backgroundColor: Colors.green),
            );
            Navigator.pop(context);
          },
          child: const Text('TUGASKAN', style: TextStyle(fontSize: 12)),
        ),
      ),
    );
  }
}
