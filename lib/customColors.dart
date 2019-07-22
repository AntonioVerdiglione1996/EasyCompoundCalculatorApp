import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._();

  static const int blue = 0xFF389dbd;

  static const MaterialColor blue_sky = MaterialColor(
    blue,
    <int, Color>{
      50: Color(0xFF389dbd),
      100: Color(0xFF389dbd),
      200: Color(0xFF389dbd),
      300: Color(0xFF389dbd),
      400: Color(0xFF389dbd),
      500: Color(blue),
      600: Color(0xFF389dbd),
      700: Color(0xFF389dbd),
      800: Color(0xFF389dbd),
      900: Color(0xFF389dbd),
    },
  );

  static const MaterialColor cyan = MaterialColor(
    _cyan,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_cyan),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _aquaGreen = 0xFF007CC3;

  static const MaterialColor aquaGreen = MaterialColor(
    _aquaGreen,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_aquaGreen),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _cyan = 0xFF74C0B7;
}
