import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeeMasterScreen extends StatelessWidget {
  const BeeMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 195, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 195, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/gradient_maker.png',
                  height: 350,
                  width: double.infinity,
                ),
                Image.asset(
                  'lib/assets/images/budgeting bee pose 3 3.png',
                  height: 197,
                  width: 147.75,
                ),
                Positioned(
                  top: 270,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Text(
                    'Budgeting Master',
                    style: GoogleFonts.manrope(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-2.0, -2.0),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(2.0, -2.0),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(2.0, 2.0),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-2.0, 2.0),
                              color: Colors.black),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              'Budgeting Master',
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              '1 0f 5',
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              'Budgeting Master',
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
