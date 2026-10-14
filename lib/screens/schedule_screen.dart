import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jadwal',
              style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Jadwal Harian'),
              Tab(text: 'Jadwal Mingguan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Harian
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text('Hari Ini - 15 Oktober',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 12),
                _buildScheduleCard(
                    context, '08:00 - 09:30', '11 IPS 2', 'Bahasa Indonesia',
                    isReplacement: true),
                _buildScheduleCard(
                    context, '10:00 - 11:30', '10 MIPA 1', 'Bahasa Indonesia',
                    isReplacement: false),
              ],
            ),
            // Tab Mingguan (Placeholder)
            const Center(child: Text('Tampilan Jadwal Mingguan')),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleCard(
      BuildContext context, String time, String kelas, String mapel,
      {required bool isReplacement}) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isReplacement
            ? const BorderSide(color: Colors.red)
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                if (isReplacement)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text('Piket',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Container(width: 2, height: 40, color: Colors.grey.shade300),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(kelas,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(mapel, style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
