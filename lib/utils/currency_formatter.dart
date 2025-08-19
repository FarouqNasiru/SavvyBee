import 'package:intl/intl.dart';

class CurrencyFormatter {
  // Unicode for Naira symbol
  static const String nairaSymbol = '₦';
  // Fallback symbol if naira doesn't display properly
  static const String fallbackSymbol = 'NGN';
  
  static final NumberFormat _formatter = NumberFormat.currency(
    locale: 'en_NG',
    symbol: nairaSymbol,
    decimalDigits: 0,
  );

  static String formatNaira(double amount) {
    return _formatter.format(amount);
  }

  static String format(double amount) {
    return '$nairaSymbol${amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}';
  }

  static String formatWithDecimals(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'en_NG',
      symbol: nairaSymbol,
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  static String formatAmount(double amount, {String currency = nairaSymbol}) {
    final formatter = NumberFormat.currency(
      locale: 'en_NG',
      symbol: currency,
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  // Method to get naira symbol with fallback
  static String getNairaSymbol() {
    return nairaSymbol;
  }

  // Method to format with fallback if naira symbol doesn't display
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

  static double parseAmount(String amountString) {
    // Remove currency symbols and commas
    final cleanString = amountString.replaceAll(RegExp(r'[₦,\s]'), '');
    return double.tryParse(cleanString) ?? 0.0;
  }
}
