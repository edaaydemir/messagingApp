import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBTKmMEcjfSltZAA2g1HpUXvfv0WaS7WTY",
      authDomain: "messagingapp-6e279.firebaseapp.com",
      projectId: "messagingapp-6e279",
      storageBucket: "messagingapp-6e279.firebasestorage.app",
      messagingSenderId: "351322603738",
      appId: "1:351322603738:web:a52a4a30fcffa8986e25e3",
      measurementId: "G-DNPZG2ZZZK",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Messaging App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Light background color
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light, // Light theme
        ),
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: Colors.black87,
              displayColor: Colors.black87,
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
