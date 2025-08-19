import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/wallet_provider.dart';
import '../providers/bank_account_provider.dart';

class WithdrawScreen extends StatefulWidget {
  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  String? _bankName;
  String? _accountNumber;

  void initState() {
    super.initState();
    _fetchBankDetails();
  }

  Future<void> _fetchBankDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final bankAccount = doc.data()?['bankAccount'];
      setState(() {
        _bankName = bankAccount?['bankName'] ?? '';
        _accountNumber = bankAccount?['accountNumber'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.06;
    final verticalPadding = size.height * 0.02;
    final smallSpacing = size.height * 0.015;
    final mediumSpacing = size.height * 0.03;
    final largeSpacing = size.height * 0.05;
    final iconSize = size.width * 0.12;
    final titleFontSize = size.height * 0.018;
    final subtitleFontSize = size.height * 0.015;
    final buttonHeight = size.height * 0.06;
    final textFieldHeight = size.height * 0.07;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black, size: size.width * 0.06),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Withdraw',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontSize: titleFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer2<WalletProvider, BankAccountProvider>(
        builder: (context, walletProvider, bankProvider, child) {
          return Padding(
            padding: EdgeInsets.only(
              top: verticalPadding,
              left: horizontalPadding,
              right: horizontalPadding,
              bottom: verticalPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Text(
                      'Enter the amount you would like to withdraw from your wallet',
                      style: GoogleFonts.manrope(
                        color: Colors.grey[600],
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: mediumSpacing),

                  // From Wallet Section
                  Image.asset(
                    "lib/assets/images/Frame 342.png",
                    width: iconSize,
                    height: iconSize,
                  ),
                  SizedBox(height: smallSpacing * 0.3),
                  Text(
                    'From Wallet',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${walletProvider.formatCurrency(walletProvider.walletBalance)} • Wallet',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: smallSpacing * 0.5),

                  // Dotted Line
                  Image.asset(
                    "lib/assets/images/Line 14.png",
                    width: size.width * 0.005,
                    height: size.height * 0.08,
                  ),
                  SizedBox(height: smallSpacing * 0.5),

                  // To Linked Account Section
                  Image.asset(
                    "lib/assets/images/Frame 343.png",
                    width: iconSize,
                    height: iconSize,
                  ),
                  SizedBox(height: smallSpacing * 0.3),
                  Text(
                    'To Linked Account',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${_bankName ?? 'Bank'} • ${_accountNumber ?? 'Account'}',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: largeSpacing),

                  // Amount Field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Amount',
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: smallSpacing),
                  _buildTextField(
                    size,
                    'Input Amount',
                    walletProvider.withdrawAmount,
                    (value) => walletProvider.setWithdrawAmount(value),
                    keyboardType: TextInputType.number,
                    height: textFieldHeight,
                  ),
                  SizedBox(height: smallSpacing),

                  // Password Field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: smallSpacing),
                  _buildTextField(
                    size,
                    'Input pin',
                    walletProvider.password,
                    (value) => walletProvider.setPassword(value),
                    obscureText: true,
                    height: textFieldHeight,
                  ),

                  SizedBox(height: 24), // or any value that fits your design

                  // Withdraw Button
                  Container(
                    width: double.infinity,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 1),
                        left: BorderSide(color: Colors.black, width: 1),
                        right: BorderSide(color: Colors.black, width: 3),
                        bottom: BorderSide(color: Colors.black, width: 3),
                      ),
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                    ),
                    child: ElevatedButton(
                      onPressed: walletProvider.isWithdrawFormValid &&
                              !walletProvider.isLoading
                          ? () => _processWithdrawal(context, walletProvider)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFB800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: walletProvider.isLoading
                          ? CircularProgressIndicator(color: Colors.black)
                          : Text(
                              'Withdraw',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: titleFontSize * 1.1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(
    Size size,
    String hint,
    String value,
    Function(String) onChanged, {
    TextInputType? keyboardType,
    bool obscureText = false,
    required double height,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: value.isNotEmpty ? Colors.black : Colors.grey, width: 1),
          left: BorderSide(
              color: value.isNotEmpty ? Colors.black : Colors.grey, width: 1),
          right: BorderSide(
              color: value.isNotEmpty ? Colors.black : Colors.grey, width: 3),
          bottom: BorderSide(
              color: value.isNotEmpty ? Colors.black : Colors.grey, width: 3),
        ),
        borderRadius: BorderRadius.circular(size.width * 0.02),
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              TextStyle(color: Colors.grey[400], fontSize: size.height * 0.016),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
        ),
      ),
    );
  }

  void _processWithdrawal(BuildContext context, WalletProvider provider) async {
    bool success = await provider.processWithdrawal();

    if (success) {
      // Load the updated wallet balance from Firestore
      await provider.loadWalletBalance();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Withdrawal processed successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); // Go back after successful withdrawal
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to process withdrawal. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
