import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/bank_account_provider.dart';

class LinkAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Link you Bank Account',
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<BankAccountProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.only(
                top: 17.0, left: 26.0, right: 26.0, bottom: 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Connect your bank account to your wallet securely', textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 21),

                // Account Number Field
                _buildLabel('Account Number'),
                SizedBox(height: 8),
                _buildTextField(
                  'Input Account Number',
                  provider.accountNumber,
                  (value) => provider.setAccountNumber(value),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8),

                // Bank Name Dropdown
                _buildLabel('Bank Name'),
                SizedBox(height: 8),
                _buildDropdown(
                  'Select Bank',
                  provider.selectedBank,
                  provider.banks,
                  (value) => provider.setSelectedBank(value!),
                ),
                SizedBox(height: 8),

                // Account Holder Name Field
                _buildLabel('Account Holder Name'),
                SizedBox(height: 8),
                _buildTextField(
                  'Account Holder Name',
                  provider.accountHolderName,
                  (value) => provider.setAccountHolderName(value),
                ),
                SizedBox(height: 8),

                // Account Type Dropdown
                _buildLabel('Account Type'),
                SizedBox(height: 8),
                _buildDropdown(
                  'Account Type',
                  provider.selectedAccountType,
                  provider.accountTypes,
                  (value) => provider.setSelectedAccountType(value!),
                ),

                Spacer(),

                // Link Account Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: provider.isFormValid
                                ? Colors.black
                                : Colors.grey,
                            width: 1),
                        left: BorderSide(
                            color: provider.isFormValid
                                ? Colors.black
                                : Colors.grey,
                            width: 1),
                        right: BorderSide(
                            color: provider.isFormValid
                                ? Colors.black
                                : Colors.grey,
                            width: 3),
                        bottom: BorderSide(
                            color: provider.isFormValid
                                ? Colors.black
                                : Colors.grey,
                            width: 3),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: provider.isFormValid && !provider.isLoading
                          ? () => _linkAccount(context, provider)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFB800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: provider.isLoading
                          ? CircularProgressIndicator(color: Colors.black)
                          : Text(
                              'Link account',
                              style: GoogleFonts.manrope(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.manrope(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    String value,
    Function(String) onChanged, {
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Container(
      height: 60,
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
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.manrope(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String hint,
    String value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: value.isNotEmpty
                                  ? Colors.black
                                  : Colors.grey,
                              width: 1),
                          left: BorderSide(
                              color: value.isNotEmpty
                                  ? Colors.black
                                  : Colors.grey,
                              width: 1),
                          right: BorderSide(
                              color: value.isNotEmpty
                                  ? Colors.black
                                  : Colors.grey,
                              width: 3),
                          bottom: BorderSide(
                              color: value.isNotEmpty
                                  ? Colors.black
                                  : Colors.grey,
                              width: 3),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
      child: DropdownButtonFormField<String>(
        value: value.isEmpty ? null : value,
        hint: Text(
          hint,
          style: GoogleFonts.manrope(color: Colors.grey[400]),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  void _linkAccount(BuildContext context, BankAccountProvider provider) async {
    // Using a dummy user ID - in a real app, get this from authentication

    bool success =
        await provider.linkAccount(FirebaseAuth.instance.currentUser!.uid);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bank account linked successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      provider.clearForm();
      Navigator.pop(context); // Navigate back after linking
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to link bank account. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
