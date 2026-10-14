import 'package:cloud_firestore/cloud_firestore.dart';

enum UserRole {
  admin,
  guru,
}

extension UserRoleExtension on UserRole {
  String get value {
    switch (this) {
      case UserRole.admin:
        return 'admin';
      case UserRole.guru:
        return 'guru';
    }
  }

  static UserRole fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'guru':
      default:
        return UserRole.guru;
    }
  }
}

class AppUser {
  final String uid;
  final String email;
  final String nama;
  final String role;
  final String nip;
  final String noHp;
  final String? photoUrl;

  const AppUser({
    required this.uid,
    required this.email,
    required this.nama,
    required this.role,
    this.nip = '',
    this.noHp = '',
    this.photoUrl,
  });

  UserRole get userRole => UserRoleExtension.fromString(role);

  factory AppUser.fromMap(
    String uid,
    Map<String, dynamic> data,
  ) {
    return AppUser(
      uid: uid,
      email: data['email']?.toString() ?? '',
      nama: data['nama']?.toString() ?? '',
      role: data['role']?.toString() ?? 'guru',
      nip: data['nip']?.toString() ?? '',
      noHp: data['noHp']?.toString() ?? '',
      photoUrl: data['photoUrl']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nama': nama,
      'role': role,
      'nip': nip,
      'noHp': noHp,
      'photoUrl': photoUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}

class Guru {
  final String id;
  final String nama;
  final String nip;
  final String email;
  final String noHp;
  final String mataPelajaran;
  final bool tersedia;
  final bool aktif;

  const Guru({
    required this.id,
    required this.nama,
    required this.nip,
    required this.email,
    this.noHp = '',
    this.mataPelajaran = '',
    this.tersedia = true,
    this.aktif = true,
  });

  factory Guru.fromMap(
    String id,
    Map<String, dynamic> data,
  ) {
    return Guru(
      id: id,
      nama: data['nama']?.toString() ?? '',
      nip: data['nip']?.toString() ?? '',
      email: data['email']?.toString() ?? '',
      noHp: data['noHp']?.toString() ?? '',
      mataPelajaran: data['mataPelajaran']?.toString() ?? '',
      tersedia: data['tersedia'] == true,
      aktif: data['aktif'] != false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nip': nip,
      'email': email,
      'noHp': noHp,
      'mataPelajaran': mataPelajaran,
      'tersedia': tersedia,
      'aktif': aktif,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}

class Jadwal {
  final String id;
  final String guruId;
  final String guruNama;
  final String mataPelajaran;
  final String kelas;
  final String hari;
  final String jamMulai;
  final String jamSelesai;

  const Jadwal({
    required this.id,
    required this.guruId,
    required this.guruNama,
    required this.mataPelajaran,
    required this.kelas,
    required this.hari,
    required this.jamMulai,
    required this.jamSelesai,
  });

  factory Jadwal.fromMap(
    String id,
    Map<String, dynamic> data,
  ) {
    return Jadwal(
      id: id,
      guruId: data['guruId']?.toString() ?? '',
      guruNama: data['guruNama']?.toString() ?? '',
      mataPelajaran: data['mataPelajaran']?.toString() ?? '',
      kelas: data['kelas']?.toString() ?? '',
      hari: data['hari']?.toString() ?? '',
      jamMulai: data['jamMulai']?.toString() ?? '',
      jamSelesai: data['jamSelesai']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guruId': guruId,
      'guruNama': guruNama,
      'mataPelajaran': mataPelajaran,
      'kelas': kelas,
      'hari': hari,
      'jamMulai': jamMulai,
      'jamSelesai': jamSelesai,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}

enum AssignmentStatus {
  pending,
  accepted,
  rejected,
}

extension AssignmentStatusExtension on AssignmentStatus {
  String get value {
    switch (this) {
      case AssignmentStatus.pending:
        return 'menunggu';
      case AssignmentStatus.accepted:
        return 'diterima';
      case AssignmentStatus.rejected:
        return 'ditolak';
    }
  }

  static AssignmentStatus fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'diterima':
        return AssignmentStatus.accepted;
      case 'ditolak':
        return AssignmentStatus.rejected;
      case 'menunggu':
      default:
        return AssignmentStatus.pending;
    }
  }
}

class Penugasan {
  final String id;
  final String guruPenggantiId;
  final String guruPenggantiNama;
  final String guruAsliId;
  final String guruAsliNama;
  final String mataPelajaran;
  final String kelas;
  final String tanggal;
  final String jam;
  final String status;

  const Penugasan({
    required this.id,
    required this.guruPenggantiId,
    required this.guruPenggantiNama,
    required this.guruAsliId,
    required this.guruAsliNama,
    required this.mataPelajaran,
    required this.kelas,
    required this.tanggal,
    required this.jam,
    this.status = 'menunggu',
  });

  factory Penugasan.fromMap(
    String id,
    Map<String, dynamic> data,
  ) {
    return Penugasan(
      id: id,
      guruPenggantiId: data['guruPenggantiId']?.toString() ?? '',
      guruPenggantiNama: data['guruPenggantiNama']?.toString() ?? '',
      guruAsliId: data['guruAsliId']?.toString() ?? '',
      guruAsliNama: data['guruAsliNama']?.toString() ?? '',
      mataPelajaran: data['mataPelajaran']?.toString() ?? '',
      kelas: data['kelas']?.toString() ?? '',
      tanggal: data['tanggal']?.toString() ?? '',
      jam: data['jam']?.toString() ?? '',
      status: data['status']?.toString() ?? 'menunggu',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guruPenggantiId': guruPenggantiId,
      'guruPenggantiNama': guruPenggantiNama,
      'guruAsliId': guruAsliId,
      'guruAsliNama': guruAsliNama,
      'mataPelajaran': mataPelajaran,
      'kelas': kelas,
      'tanggal': tanggal,
      'jam': jam,
      'status': status,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}

class AppNotification {
  final String id;
  final String userId;
  final String title;
  final String message;
  final String type;
  final bool isRead;
  final DateTime? createdAt;

  const AppNotification({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    this.isRead = false,
    this.createdAt,
  });

  factory AppNotification.fromMap(
    String id,
    Map<String, dynamic> data,
  ) {
    final timestamp = data['createdAt'];

    return AppNotification(
      id: id,
      userId: data['userId']?.toString() ?? '',
      title: data['title']?.toString() ?? '',
      message: data['message']?.toString() ?? '',
      type: data['type']?.toString() ?? 'general',
      isRead: data['isRead'] == true,
      createdAt: timestamp is Timestamp ? timestamp.toDate() : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'message': message,
      'type': type,
      'isRead': isRead,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
