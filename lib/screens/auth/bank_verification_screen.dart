import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../home/home_screen.dart';

class BankVerificationScreen extends StatefulWidget {
  @override
  _BankVerificationScreenState createState() => _BankVerificationScreenState();
}

class _BankVerificationScreenState extends State<BankVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bvnController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _bankNameController = TextEditingController();

  final List<String> _banks = [
    'Access Bank',
    'Zenith Bank',
    'GTBank',
    'First Bank',
    'UBA',
    'Wema Bank',
    'Sterling Bank',
    'Fidelity Bank',
    'Union Bank',
    'Stanbic IBTC',
  ];

  String? _selectedBank;

  @override
  void dispose() {
    _bvnController.dispose();
    _accountNumberController.dispose();
    _bankNameController.dispose();
    super.dispose();
  }

  Future<void> _verifyBankDetails() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
   // final success = await authProvider.verifyBankDetails(
     // _bvnController.text.trim(),
      //_accountNumberController.text.trim(),
      //_selectedBank!,
    //);

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage ?? 'Verification failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Verification'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            Icons.account_balance,
                            size: 40,
                            color: Colors.green[600],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Verify Your Bank Details',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'We need to verify your bank account to ensure secure transactions',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 32),
                  
                  // BVN Field
                  TextFormField(
                    controller: _bvnController,
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                      labelText: 'BVN (Bank Verification Number)',
                      prefixIcon: Icon(Icons.credit_card),
                      counterText: '',
                      helperText: 'Your 11-digit BVN',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your BVN';
                      }
                      if (value.length != 11) {
                        return 'BVN must be 11 digits';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'BVN must contain only numbers';
                      }
                      return null;
                    },
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Bank Selection
                  DropdownButtonFormField<String>(
                    value: _selectedBank,
                    decoration: InputDecoration(
                      labelText: 'Select Bank',
                      prefixIcon: Icon(Icons.account_balance),
                    ),
                    items: _banks.map((bank) {
                      return DropdownMenuItem(
                        value: bank,
                        child: Text(bank),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedBank = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your bank';
                      }
                      return null;
                    },
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Account Number Field
                  TextFormField(
                    controller: _accountNumberController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Account Number',
                      prefixIcon: Icon(Icons.account_balance_wallet),
                      counterText: '',
                      helperText: 'Your 10-digit account number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your account number';
                      }
                      if (value.length != 10) {
                        return 'Account number must be 10 digits';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Account number must contain only numbers';
                      }
                      return null;
                    },
                  ),
                  
                  SizedBox(height: 32),
                  
                  // Verify Button
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, child) {
                      return ElevatedButton(
                        onPressed: authProvider.isLoading ? null : _verifyBankDetails,
                        child: authProvider.isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('Verify Bank Details'),
                      );
                    },
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Skip Button
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
                    },
                    child: Text('Skip for now'),
                  ),
                  
                  SizedBox(height: 24),
                  
                  // Security Notice
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.security,
                          color: Colors.blue[600],
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Your bank details are encrypted and secure. We use industry-standard security measures.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
