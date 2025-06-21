import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavvybotChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
   
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Savvy Bot',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Top section with background image
          Container(
            width: screenWidth,
                    height: 180, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/Rectangle 6.png'),
                fit: BoxFit.cover, // Cover the container while maintaining aspect ratio
                alignment: Alignment.topCenter, // Align the image to the top
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight, // Account for app bar height
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Icon(Icons.face, color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Hi There 👋',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'This is a private message between you and buddy.\nThis chat is end-to-end encrypted...',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          // Rest of the content
          Expanded(
            child: Container(
              color: Colors.white, // Background color for the rest of the screen
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Icon(Icons.face, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Hey there! 👋 I'm Savvy, your smart assistant here on SavvyBee — built to help you take control of your money, one simple step at a time.",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Bottom buttons
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child:
                            OptionButton(text: 'How can I start saving money')),
                    SizedBox(width: 10),
                    Expanded(
                        child: OptionButton(text: 'Help me create a Budget')),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: OptionButton(
                            text: "I'm feeling stressed about my finances")),
                    SizedBox(width: 10),
                    Expanded(
                        child:
                            OptionButton(text: 'I want to track my spending')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;

  OptionButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
      ),
      child: Text(text, style: TextStyle(color: Colors.black)),
    );
  }
}