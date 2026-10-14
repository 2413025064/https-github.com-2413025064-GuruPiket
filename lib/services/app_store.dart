import 'package:flutter/material.dart';
import '../models/app_models.dart';

class AppStore extends ChangeNotifier {
  AppUser? _currentUser;
  bool _isLoading = false;

  AppUser? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  Future<void> checkSession() async {
    setLoading(true);
    await Future.delayed(const Duration(milliseconds: 500));
    setLoading(false);
  }

  // Fungsi Login Dummy (Tanpa Firebase)
  Future<void> loginUser(String email, String password) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1)); // Simulasi loading
    
    String assignedRole = email.toLowerCase().contains('admin') ? 'Admin' : 'Guru';
    
    _currentUser = AppUser(
      uid: 'dummy_123',
      email: email,
      nama: assignedRole == 'Admin' ? 'Admin Drs. H. Muhammad' : 'Guru Budi',
      role: assignedRole,
    );
    
    setLoading(false);
    notifyListeners();
  }

  Future<void> logoutUser() async {
    _currentUser = null;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}