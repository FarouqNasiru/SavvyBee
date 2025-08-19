import 'package:flutter/material.dart';

class NairaSymbolWidget extends StatelessWidget {
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fallbackText;

  const NairaSymbolWidget({
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fallbackText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '₦',
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
        // Use a font that supports the naira symbol
        fontFamily: 'Inter',
        // Fallback to system font if Inter doesn't work
        fontFamilyFallback: ['Roboto', 'Arial', 'sans-serif'],
      ),
    );
  }
}

class NairaTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const NairaTextWidget({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
        fontFamily: 'Inter',
        fontFamilyFallback: ['Roboto', 'Arial', 'sans-serif'],
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

// Utility function to format currency with naira symbol
class NairaFormatter {
  static String format(double amount) {
    return '₦${amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}';
  }

  static String formatWithFallback(double amount) {
    try {
      return format(amount);
    } catch (e) {
      // If naira symbol fails, use NGN
      return 'NGN ${amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      )}';
    }
  }
} 