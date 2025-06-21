import 'package:flutter/material.dart';
import 'package:savvybee/Hive_home_page.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return NavigationBar(
      height: screenHeight * 0.08, // 8% of screen height
      backgroundColor: Colors.black,
      onDestinationSelected: (int index) {
        final labels = ['Home', 'Games', 'Hive', 'Premium', 'Dashboard'];
        final selectedLabel = labels[index];
        if (selectedLabel == 'Hive') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HiveHomePage()),
          );
        }
        // Handle other destinations as needed
      },
      destinations: [
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/solar_home-2-outline.png",
            width: 24,
            height: 24,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/solar_gamepad-linear.png",
            width: 24,
            height: 24,
          ),
          label: 'Games',
        ),
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/material-symbols-light_hive-rounded.png",
            width: 24,
            height: 24,
          ),
          label: 'Hive',
        ),
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/solar_crown-star-linear.png",
            width: 24,
            height: 24,
          ),
          label: 'Premium',
        ),
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/si_dashboard-line.png",
            width: 24,
            height: 24,
          ),
          label: 'Dashboard',
        ),
      ],
      indicatorColor: Colors.transparent, // Remove the highlight indicator
    );
  }
}