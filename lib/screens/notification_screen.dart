import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          ListTile(
            tileColor: Colors.blue.shade50,
            leading: const Icon(Icons.notifications_active, color: Colors.blue),
            title: const Text('Penugasan Mendesak!',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle:
                const Text('Anda ditugaskan piket kelas 11 IPS 2 hari ini.'),
            trailing: const Text('Baru saja',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          const Divider(height: 1),
          const ListTile(
            leading: Icon(Icons.notifications_none, color: Colors.grey),
            title: Text('Sistem Terhubung'),
            subtitle: Text('Data berhasil disinkronisasi dengan server.'),
            trailing: Text('Kemarin',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
