import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFFC107); // Yellow/Amber
  static const Color secondaryColor = Color(0xFFFF9800); // Orange
  static const Color accentColor = Color(0xFFFFB74D);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.amber,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryColor),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey[600],
      type: BottomNavigationBarType.fixed,
    ),
  );
}
