import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/icon_grid.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/level_card.dart';
import 'package:savvybee/progress_provider.dart';


class BudgetingPage extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  final int levels;
  final int games;
  final int coins;

  const BudgetingPage({
    Key? key,
    required this.category,
    required this.title,
    required this.description,
    required this.levels,
    required this.games,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final completedLevel = context.watch<ProgressProvider>().getCompletedLevel(category);
    final completedStage = context.watch<ProgressProvider>().getCompletedStage(category);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Background image (BG 2.png)
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Image.asset(
                        "lib/assets/images/BG 2.png",
                        fit: BoxFit.cover,
                        width: 120,
                        height: 140,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text and description
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: GoogleFonts.manrope(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 1),
                                Text(
                                  description,
                                  style: GoogleFonts.manrope(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    // Icon and text for "Levels"
                                    Row(
                                      children: [
                                        Image.asset(
                                          "lib/assets/images/material-symbols-light_hive-outline-rounded.png",
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "$levels Levels",
                                          style: GoogleFonts.manrope(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    // Icon and text for "Games"
                                    Row(
                                      children: [
                                        Image.asset(
                                          "lib/assets/images/proicons_game.png",
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "$games Games",
                                          style: GoogleFonts.manrope(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    // Icon and text for "Coins"
                                    Row(
                                      children: [
                                        Image.asset(
                                          "lib/assets/images/clarity_coin-bag-line.png",
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "$coins Coins",
                                          style: GoogleFonts.manrope(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Foreground image (dynamic based on category)
                          Image.asset(
                            _getImageForCategory(category),
                            width: 80,
                            height: 140,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28),
              child: Divider(
                color: Colors.grey[100],
                thickness: 4,
                height: 36,
              ),
            ),
            const SizedBox(height: 10),

            // Dynamically generate LevelCards and IconGrids for each level
            ...List.generate(
              levels,
              (levelIndex) => Column(
                children: [
                  LevelCard(
                    category: category,
                    level: levelIndex,
                  ),
                  const SizedBox(height: 36),
                  IconGrid(
                    category: category,
                    level: levelIndex,
                    title: title,
                    description: description,
                    levels: levels,
                    games: games,
                    coins: coins,
                    completedLevel: completedLevel,
                    completedStage: completedStage,
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
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
          height: 24,
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  String _getImageForCategory(String category) {
    switch (category) {
      case 'Budgeting':
        return 'lib/assets/images/budgeting bee pose 3 2.png';
      case 'Savings':
        return 'lib/assets/images/savings bee pose lg.PNG';
      case 'Numeracy':
        return 'lib/assets/images/numeracy_bee_lg.PNG';
      default:
        return 'lib/assets/images/budgeting bee pose 3 2.png';
    }
  }
}