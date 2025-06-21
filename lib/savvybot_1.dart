import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/savvybot_chat_screen.dart';

class Savvybot1 extends StatelessWidget {
  const Savvybot1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack for header and yellow card
            SizedBox(
              height: 420, // 300 for image + 80 for yellow card
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Header image
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      'lib/assets/images/image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Welcome text overlay
                  Positioned(
                    left: 20,
                    right: 20,
                    top: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi There 👋',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Hey There! Welcome to Savvy Bot. I have a response to every message, thoughts, So feel to ask anything!',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  // Yellow card overlay (now at the bottom of the Stack)
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 0, // <-- changed from -60 to 0
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 195, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Start Conversation',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 44, 44, 44),
                                radius: 28.5,
                                child: ClipOval(
                                  child: Image.asset(
                                    'lib/assets/images/Character 19.png',
                                    width: 47,
                                    height: 47,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Savvy Usual Reply Time',
                                    style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '⏱️ 2 Min',
                                    style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SavvybotChatScreen(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Send Message to Savvy',
                                style: GoogleFonts.manrope(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17),
            // Negative margin to pull up Monthly Reports for overlap effect
            Padding(
              padding: const EdgeInsets.only(top: 0), // negative top padding
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Monthly Reports',
                    style: GoogleFonts.manrope(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F6FC),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Column(
                        children: [
                          Text('54256',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 5),
                          Text('Message Sent'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F6FC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Text('49823',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 5),
                          Text('Message Receive'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Recent Conversation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text('Recent Conversation',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  ConversationTile(title: 'Tips on Savings'),
                  SizedBox(height: 10),
                  ConversationTile(title: 'Analysis on your Budget'),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
            side: BorderSide(width: 2, color: Color(0xFFDF7600))),
        onPressed: () {
          // Add your action here
        },
        backgroundColor: const Color(0xFFFFE975),
        child: Image.asset(
            "lib/assets/images/material-symbols_hive-rounded2.png",
            width: 24,
            height: 24),
      ),
    );
  }
}

class ConversationTile extends StatelessWidget {
  final String title;

  const ConversationTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 243, 204),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 255, 243, 204),
            radius: 32,
            child: ClipOval(
              child: Image.asset(
                'lib/assets/images/Character 19.png',
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text(
            'Savvy - 2d ago',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
