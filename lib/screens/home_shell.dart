import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/app_store.dart';

// Import seluruh screen
import 'dashboard_screen.dart';
import 'admin_dashboard_screen.dart';
import 'schedule_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppStore>().currentUser;
    final bool isAdmin = user?.role == 'Admin';

    // Daftar menu navigasi menggunakan screen asli
    final List<Widget> currentScreens = [
      isAdmin ? const AdminDashboardScreen() : const DashboardScreen(),
      const ScheduleScreen(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: currentScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Jadwal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
