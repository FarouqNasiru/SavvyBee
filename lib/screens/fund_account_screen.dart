import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/fund_provider.dart';
import '../providers/wallet_provider.dart';
import '../providers/bank_account_provider.dart';

class FundAccountScreen extends StatefulWidget {
  @override
  State<FundAccountScreen> createState() => _FundAccountScreenState();
}

class _FundAccountScreenState extends State<FundAccountScreen> {
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
    final horizontalPadding = size.width * 0.06; // ~24px on standard screens
    final verticalPadding = size.height * 0.02;
    final smallSpacing = size.height * 0.015; // ~12px
    final mediumSpacing = size.height * 0.03; // ~24px
    final largeSpacing = size.height * 0.07; // ~53px
    final iconSize = size.width * 0.12; // ~48px
    final titleFontSize = size.height * 0.018; // ~14px
    final subtitleFontSize = size.height * 0.015; // ~12px
    final buttonHeight = size.height * 0.06; // ~50px
    final textFieldHeight = size.height * 0.07; // ~60px

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
          'Fund',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontSize: titleFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer3<FundProvider, WalletProvider, BankAccountProvider>(
        builder: (context, fundProvider, walletProvider, bankProvider, child) {
          return Padding(
            padding: EdgeInsets.only(
              top: 0.0,
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
                      'Enter the amount you would like to Fund from your linked account',
                      style: GoogleFonts.manrope(
                        color: Colors.grey[600],
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: mediumSpacing),

                  // To Linked Account Section (Top)
                  Image.asset(
                    "lib/assets/images/Frame 343.png",
                    width: iconSize,
                    height: iconSize,
                  ),
                  SizedBox(height: smallSpacing * 0.15),
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

                  SizedBox(height: smallSpacing * 0.5),

                  // Dotted Line
                  Image.asset(
                    "lib/assets/images/Line 14.png",
                    width: size.width * 0.005,
                    height: size.height * 0.08,
                  ),
                  SizedBox(height: smallSpacing * 0.5),

                  // From Wallet Section (Bottom)
                  Image.asset(
                    "lib/assets/images/Frame 342.png",
                    width: iconSize,
                    height: iconSize,
                  ),
                  SizedBox(height: smallSpacing * 0.15),
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
                    fundProvider.fundAmount,
                    (value) => fundProvider.setFundAmount(value),
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
                    fundProvider.password,
                    (value) => fundProvider.setPassword(value),
                    obscureText: true,
                    height: textFieldHeight,
                  ),

                  SizedBox(height: 24), // or any value that fits your design

                  // Fund Account Button
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
                      onPressed: fundProvider.isFundFormValid &&
                              !fundProvider.isLoading
                          ? () => _processFunding(
                              context, fundProvider, walletProvider)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFB800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: fundProvider.isLoading
                          ? CircularProgressIndicator(color: Colors.black)
                          : Text(
                              'Fund Account',
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

  void _processFunding(BuildContext context, FundProvider fundProvider,
      WalletProvider walletProvider) async {
    double fundedAmount = double.parse(fundProvider.fundAmount);
    bool success = await fundProvider.processFunding();

    if (success) {
      // Load the updated wallet balance from Firestore
      await walletProvider.loadWalletBalance();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Account funded successfully! ₦${fundedAmount.toStringAsFixed(0)} added to wallet.'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fund account. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
