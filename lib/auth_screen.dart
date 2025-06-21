import 'package:flutter/material.dart';
import 'package:savvybee/crreate_account_page.dart';
import 'package:savvybee/login_page.dart';
import 'package:savvybee/reusable_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Make the screen scrollable
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: [
            // Directly style the image
            Center(
              child: Image.asset(
                "lib/assets/images/BeeFamily.png",
                width: screenWidth,
                fit: BoxFit.fitWidth, // Ensure the image fills the width
              ),
            ),
            const SizedBox(height: 10),
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Join the Hive!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left, // Align text to the left
              ),
            ),
            const SizedBox(height: 30),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ReusableButton(
                text: 'Create an account',
                onPressed: () {
                  // Handle create account action
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrreateAccountPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ReusableButton(
                text: 'Log in',
                onPressed: () {
                  // Handle log in action
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ),
            // Separator
            const SizedBox(height: 25),
            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0), // Add padding
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0), // Add padding
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Social login icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.apple),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
