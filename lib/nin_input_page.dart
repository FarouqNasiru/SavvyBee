import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/bvn_input_page.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/question_page.dart';
import 'nin_provider.dart';

class NinInputPage extends StatelessWidget {
  const NinInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => NinProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              'lib/assets/images/solar_close-square-linear.png', // Replace with your image path
              height: 20, // Adjust size as needed
              width: 20, // Adjust size as needed
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              ); // Navigate back when the button is pressed
            },
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Provide Identity and Tax Information',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Manrope',
              color: Colors.black,
            ),
          ),
          // Placeholder for spacing
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(
              bottom: 40.0, top: 0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              // Title and description
              _buildTitleSection(),
              const SizedBox(height: 20),
              // NIN input field
              _buildNinInputField(context),
              const Spacer(),
              // Continue button
              _buildContinueButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Enter Your NIN',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your National Identification Number is required for verification.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNinInputField(BuildContext context) {
    final ninProvider = Provider.of<NinProvider>(context);

    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: ninProvider.isValid ? Colors.black : Colors.grey,
              width: 1),
          left: BorderSide(
              color: ninProvider.isValid ? Colors.black : Colors.grey,
              width: 1),
          right: BorderSide(
              color: ninProvider.isValid ? Colors.black : Colors.grey,
              width: 3),
          bottom: BorderSide(
              color: ninProvider.isValid ? Colors.black : Colors.grey,
              width: 3),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: ninProvider.ninController,
        onChanged: ninProvider.updateNin,
        maxLength: 11,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 18),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: 'NIN',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    final ninProvider = Provider.of<NinProvider>(context);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: ninProvider.isValid ? Colors.black : Colors.grey,
                width: 1),
            left: BorderSide(
                color: ninProvider.isValid ? Colors.black : Colors.grey,
                width: 1),
            right: BorderSide(
                color: ninProvider.isValid ? Colors.black : Colors.grey,
                width: 3),
            bottom: BorderSide(
                color: ninProvider.isValid ? Colors.black : Colors.grey,
                width: 3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: ninProvider.isValid
              ? () {
                  print('Submitted NIN: ${ninProvider.ninController.text}');
                  // Handle valid NIN submission
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BvnInputPage(),
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                ninProvider.isValid ? Colors.yellow[700] : Colors.grey,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 2,
          ),
          child: const Text(
            "Continue",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
