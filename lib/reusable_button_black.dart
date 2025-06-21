import 'package:flutter/material.dart';

class ReusableButtonBlack extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ReusableButtonBlack({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Full width of the screen
      height: 50, // Fixed height for the button
      child: Container(
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(
                color: Color.fromARGB(255, 251, 192, 45), width: 1), // Default border width
            left: BorderSide(
                color: Color.fromARGB(255, 251, 192, 45), width: 1), // Default border width
            right: BorderSide(
                color: Color.fromARGB(255, 251, 192, 45), width: 3), // Thicker right border
            bottom: BorderSide(
                color: Color.fromARGB(255, 251, 192, 45), width: 3), // Thicker bottom border
          ),
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Bright yellow background
            foregroundColor: Colors.yellow[700], // Black text color
           
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            elevation: 2, // Slight shadow
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}