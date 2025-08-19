import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/country_selector_page.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/onboarding_data_provider.dart';
import 'date_of_birth_provider.dart';

class DateOfBirthPage extends StatelessWidget {
  const DateOfBirthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => DateOfBirthProvider(),
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
              // Date input fields
              _buildDateInputFields(context),
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
            'Enter your date of birth',
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
            'We need this to verify your identity and ensure account security.',
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

  Widget _buildDateInputFields(BuildContext context) {
    final dobProvider = Provider.of<DateOfBirthProvider>(context);
     final onboardingData = Provider.of<OnboardingDataProvider>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Day Input
        _buildDateField(
          context: context,
          hint: 'DD',
          controller: dobProvider.dayController,
          onChanged: (value) => dobProvider.updateDay(value, context),
          width: 80,
        ),
        SizedBox(
          width: 20,
        ),
        // Month Input
        _buildDateField(
          context: context,
          hint: 'MM',
          controller: dobProvider.monthController,
          onChanged: (value) => dobProvider.updateMonth(value, context),
          width: 80,
        ),
        SizedBox(
          width: 20,
        ),
        // Year Input
        _buildDateField(
          context: context,
          hint: 'YYYY',
          controller: dobProvider.yearController,
          onChanged: (value) => dobProvider.updateYear(value),
          width: 120,
        ),
      ],
    );
  }

  Widget _buildDateField({
    required BuildContext context,
    required String hint,
    required TextEditingController controller,
    required Function(String) onChanged,
    required double width,
  }) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: controller.text.isNotEmpty ? Colors.black : Colors.grey,
              width: 1),
          left: BorderSide(
              color: controller.text.isNotEmpty ? Colors.black : Colors.grey,
              width: 1),
          right: BorderSide(
              color: controller.text.isNotEmpty ? Colors.black : Colors.grey,
              width: 3),
          bottom: BorderSide(
              color: controller.text.isNotEmpty ? Colors.black : Colors.grey,
              width: 3),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLength: hint.length,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    final dobProvider = Provider.of<DateOfBirthProvider>(context);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: dobProvider.isValid ? Colors.black : Colors.grey,
                width: 1),
            left: BorderSide(
                color: dobProvider.isValid ? Colors.black : Colors.grey,
                width: 1),
            right: BorderSide(
                color: dobProvider.isValid ? Colors.black : Colors.grey,
                width: 3),
            bottom: BorderSide(
                color: dobProvider.isValid ? Colors.black : Colors.grey,
                width: 3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: dobProvider.isValid
              ? () {
                  // Handle the valid date submission
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountrySelectorPage(),
                    ),
                  );
                  print('Submitted date: ${dobProvider.formattedDate}');
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                dobProvider.isValid ? Colors.yellow[700] : Colors.grey,
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
            ),
          ),
        ),
      ),
    );
  }
}
