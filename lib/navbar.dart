import 'package:flutter/material.dart';
import 'package:savvybee/Hive_dashboard.dart';
import 'package:savvybee/Hive_home_page.dart';
import 'package:savvybee/dashboard_screen.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  Future<void> _handleHiveNavigation(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenHiveHomePage = prefs.getBool('hasSeenHiveHomePage') ?? false;

    if (!hasSeenHiveHomePage) {
      await prefs.setBool('hasSeenHiveHomePage', true);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HiveHomePage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return NavigationBar(
      height: screenHeight * 0.08, // 8% of screen height
      backgroundColor: Colors.black,
      indicatorColor: Colors.transparent, // Remove the highlight indicator
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) async {
        setState(() {
          selectedIndex = index;
        });
        final labels = ['Home', 'Games', 'Hive', 'Premium', 'Dashboard'];
        final selectedLabel = labels[index];
        if (selectedLabel == 'Hive') {
          await _handleHiveNavigation(context);
        } else if (selectedLabel == 'Home') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
        else if (selectedLabel == 'Dashboard') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        }
        // Handle other destinations as needed
      },
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12, // Reduced label size
          );
        }
        return const TextStyle(
          color: Colors.grey,
          fontSize: 8, // Reduced label size
          fontWeight: FontWeight.w400,
        );
      }),
      destinations: [
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/solar_home-2-outline.png",
            width: 24,
            height: 24,
            color: selectedIndex == 0 ? Colors.white : Colors.grey,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/solar_gamepad-linear.png",
            width: 24,
            height: 24,
            color: selectedIndex == 1 ? Colors.white : Colors.grey,
          ),
          label: 'Games',
        ),
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/material-symbols-light_hive-rounded.png",
            width: 24,
            height: 24,
            color: selectedIndex == 2 ? Colors.white : Colors.grey,
          ),
          label: 'Hive',
        ),
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/solar_crown-star-linear.png",
            width: 24,
            height: 24,
            color: selectedIndex == 3 ? Colors.white : Colors.grey,
          ),
          label: 'Premium',
        ),
        NavigationDestination(
          icon: Image.asset(
            "lib/assets/images/si_dashboard-line.png",
            width: 24,
            height: 24,
            color: selectedIndex == 4 ? Colors.white : Colors.grey,
          ),
          label: 'Dashboard',
        ),
      ],
    );
  }
}