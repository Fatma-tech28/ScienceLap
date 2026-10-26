import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF000000);
  static const Color yellow = Color(0xFFFFD100);
  static const Color ink = Color(0xFF1A1A1A);
  
  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: black,
    fontFamily: 'Nunito',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
      titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(color: ink, fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}
