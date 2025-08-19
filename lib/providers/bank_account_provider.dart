import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BankAccountProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _accountNumber = '';
  String _selectedBank = '';
  String _accountHolderName = '';
  String _selectedAccountType = '';
  bool _isLoading = false;

  // Getters
  String get accountNumber => _accountNumber;
  String get selectedBank => _selectedBank;
  String get accountHolderName => _accountHolderName;
  String get selectedAccountType => _selectedAccountType;
  bool get isLoading => _isLoading;

  // Bank options
  final List<String> banks = [
    'Access Bank',
    'GTBank',
    'First Bank',
    'UBA',
    'Zenith Bank',
    'Wema Bank',
    'Sterling Bank',
    'Fidelity Bank',
    'Union Bank',
    'Stanbic IBTC',
  ];

  // Account type options
  final List<String> accountTypes = [
    'Savings',
    'Current',
    'Fixed Deposit',
    'Domiciliary',
  ];

  // Setters
  void setAccountNumber(String value) {
    _accountNumber = value;
    notifyListeners();
  }

  void setSelectedBank(String value) {
    _selectedBank = value;
    notifyListeners();
  }

  void setAccountHolderName(String value) {
    _accountHolderName = value;
    notifyListeners();
  }

  void setSelectedAccountType(String value) {
    _selectedAccountType = value;
    notifyListeners();
  }

  // Validation
  bool get isFormValid {
    return _accountNumber.isNotEmpty &&
        _selectedBank.isNotEmpty &&
        _accountHolderName.isNotEmpty &&
        _selectedAccountType.isNotEmpty;
  }

  // Save to Firestore
  Future<bool> linkAccount(String userId) async {
    if (!isFormValid) return false;

    _isLoading = true;
    notifyListeners();

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
          'bankAccount': {
          'accountNumber': _accountNumber,
          'bankName': _selectedBank,
          'accountHolderName': _accountHolderName,
          'accountType': _selectedAccountType,
          'linkedAt': FieldValue.serverTimestamp(),
          'isBankLinked': true, // Assuming identity is verified
        }
      }, SetOptions(merge: true));

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print('Error linking account: $e');
      return false;
    }
  }

  // Clear form
  void clearForm() {
    _accountNumber = '';
    _selectedBank = '';
    _accountHolderName = '';
    _selectedAccountType = '';
    notifyListeners();
  }

  Future<void> loadLinkedAccount() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  final doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .get();

  if (doc.exists && doc.data()?['bankAccount'] != null) {
    final bankAccount = doc.data()!['bankAccount'];
    _selectedBank = bankAccount['bankName'] ?? '';
    _accountNumber = bankAccount['accountNumber'] ?? '';
    _accountHolderName = bankAccount['accountHolderName'] ?? '';
    notifyListeners();
  }
}
}
