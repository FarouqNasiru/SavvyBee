import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/currency_formatter.dart';

class FundProvider with ChangeNotifier {
  String _fundAmount = '';
  String _password = '';
  bool _isLoading = false;

  // Getters
  String get fundAmount => _fundAmount;
  String get password => _password;
  bool get isLoading => _isLoading;

  // Setters
  void setFundAmount(String value) {
    _fundAmount = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  // Validation
  bool get isFundFormValid {
    double? amount = double.tryParse(_fundAmount);
    return amount != null && 
           amount > 0 && 
           _password.isNotEmpty;
  }

  // Process funding
  Future<bool> processFunding() async {
    if (!isFundFormValid) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return false;

      final amount = double.parse(_fundAmount);
      
      // Update wallet balance in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'walletBalance': FieldValue.increment(amount),
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      // Clear form
      _fundAmount = '';
      _password = '';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error processing funding: $e');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Clear form
  void clearForm() {
    _fundAmount = '';
    _password = '';
    notifyListeners();
  }

  // Format currency
  String formatCurrency(double amount) {
    return CurrencyFormatter.format(amount);
  }
}