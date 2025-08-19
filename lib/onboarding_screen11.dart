import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/onboarding_data_provider.dart';
import 'package:savvybee/onboarding_screen12.dart';
import 'package:savvybee/onboarding_screens.dart';
import 'country_provider.dart';

class SavvyBeeOnboarding11 extends StatelessWidget {
  const SavvyBeeOnboarding11({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Set status bar to black icons
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Black icons for Android
      statusBarBrightness: Brightness.light,    // Black icons for iOS
    ));

    return ChangeNotifierProvider(
      create: (context) => CountryProvider(),
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
              );
              // Navigate back when the button is pressed
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Provide Identity and Tax Information',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Manrope',
              color: Colors.black,
            ),
          ),
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
              // Country selector
              _buildCountrySelector(context),
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
            'Confirm your Region',
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
            'This helps us make sure we take into account any regional differences and tailor your experience for where you live and pay tax.',
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

  Widget _buildCountrySelector(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);
     final OnboardingData = Provider.of<OnboardingDataProvider>(context, listen: false);
    final selectedCountry = countryProvider.selectedCountry;
    final hasSelected = countryProvider.hasSelectedCountry;

    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: hasSelected ? Colors.black : Colors.grey, width: 1),
          left: BorderSide(
              color: hasSelected ? Colors.black : Colors.grey, width: 1),
          right: BorderSide(
              color: hasSelected ? Colors.black : Colors.grey, width: 3),
          bottom: BorderSide(
              color: hasSelected ? Colors.black : Colors.grey, width: 3),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<Country>(
        dropdownColor: Colors.white,
        value: selectedCountry,
        isExpanded: true,
        underline: const SizedBox(),
        hint: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'Select Region',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
        icon: const Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30),
        ),
        items: countryProvider.countries.map((Country country) {
          return DropdownMenuItem<Country>(
            value: country,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF5F5F5), // Optional: subtle background
                    ),
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        child: Text(
                          country.flag,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    country.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        onChanged: (Country? newValue) {
          if (newValue != null) {
            countryProvider.setCountry(newValue);
            OnboardingData.updateCountry(newValue.name); // <-- Save to onboarding provider
          }
        },
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);
    final hasSelected = countryProvider.hasSelectedCountry;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: hasSelected ? Colors.black : Colors.grey, width: 1),
            left: BorderSide(
                color: hasSelected ? Colors.black : Colors.grey, width: 1),
            right: BorderSide(
                color: hasSelected ? Colors.black : Colors.grey, width: 3),
            bottom: BorderSide(
                color: hasSelected ? Colors.black : Colors.grey, width: 3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: hasSelected
              ? () {
                  final country = countryProvider.selectedCountry;
                  print('Selected country: ${country.name}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavvyBeeOnboarding12(),
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: hasSelected ? Colors.yellow[700] : Colors.grey,
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
