import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/currency_formatter.dart';

class WalletProvider with ChangeNotifier {
  double _walletBalance = 0.0;
  String _withdrawAmount = '';
  String _password = '';
  bool _isLoading = false;

  // Getters
  double get walletBalance => _walletBalance;
  String get withdrawAmount => _withdrawAmount;
  String get password => _password;
  bool get isLoading => _isLoading;

  // Setters
  void setWithdrawAmount(String value) {
    _withdrawAmount = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  // Add funds to wallet
  void addFunds(double amount) {
    _walletBalance += amount;
    notifyListeners();
  }

  // Validation
  bool get isWithdrawFormValid {
    double? amount = double.tryParse(_withdrawAmount);
    return amount != null && 
           amount > 0 && 
           amount <= _walletBalance && 
           _password.isNotEmpty;
  }

  // Process withdrawal
  Future<bool> processWithdrawal() async {
    if (!isWithdrawFormValid) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return false;

      final amount = double.parse(_withdrawAmount);
      
      // Update wallet balance in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'walletBalance': FieldValue.increment(-amount),
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      // Clear form
      _withdrawAmount = '';
      _password = '';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error processing withdrawal: $e');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Format currency
  String formatCurrency(double amount) {
    return CurrencyFormatter.format(amount);
  }

  // Load wallet balance from Firestore
  Future<void> loadWalletBalance() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        
        final data = doc.data();
        if (data != null && data['walletBalance'] != null) {
          _walletBalance = (data['walletBalance'] as num).toDouble();
          notifyListeners();
        }
      }
    } catch (e) {
      print('Error loading wallet balance: $e');
    }
  }
}