import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart'; 

import 'theme/app_theme.dart';
import 'services/app_store.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const GuruPiketApp());
}

class GuruPiketApp extends StatelessWidget {
  const GuruPiketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStore()),
      ],
      child: MaterialApp(
        title: 'GuruPiket',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme, 
        home: const SplashScreen(), 
      ),
    );
  }
}