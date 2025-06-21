import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/hexagon_container.dart';
import 'package:savvybee/home_screen_budgeting.dart';

import 'progress_provider.dart';

class IconGrid extends StatelessWidget {
  final String category;
  final int level;
  final String title;
  final String description;
  final int levels;
  final int games;
  final int coins;
  final int completedLevel;
  final int completedStage;

  const IconGrid({
    Key? key,
    required this.category,
    required this.level,
    required this.title,
    required this.description,
    required this.levels,
    required this.games,
    required this.coins,
    required this.completedLevel,
    required this.completedStage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> hexagonData = [
      {
        'stageKey': 'Stage 1',
        'title': 'Welcome!',
        'description':
            'Tracking your money helps you stay in control of your finances. It shows where your money comes from and where it goes, helping you make smarter decisions.'
      },
      {
        'stageKey': 'Stage 2',
        'title': 'Stage 2',
        'description': 'This is Stage 2. Learn more about saving!'
      },
      {
        'stageKey': 'Stage 3',
        'title': 'Stage 3',
        'description': 'Stage 3: Let\'s talk about spending wisely.'
      },
      {
        'stageKey': 'Stage 4',
        'title': 'Stage 4',
        'description': 'Stage 4: Review and reflect on your $category journey.'
      },
      {
        'stageKey': 'Stage 5',
        'title': 'Stage 5',
        'description': 'Stage 5: Advanced $category tips!'
      },
      {
        'stageKey': 'Stage 6',
        'title': 'Stage 6',
        'description': 'Stage 6: Bonus $category secrets!'
      },
    ];

    final unlockedStages =
        context.watch<ProgressProvider>().unlockedStagesFor(category, level);

    Widget buildHexagon(int i, {Color? color, Color? borderColor}) {
      final stageKey = hexagonData[i]['stageKey']!;
      final isUnlocked = unlockedStages.contains(stageKey);

      return GestureDetector(
        onTap: isUnlocked
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreenBudgeting(
                      category: category,
                      level: level,
                      stageKey: stageKey,
                      title: hexagonData[i]['title']!,
                      description: hexagonData[i]
                          ['description']!, // <-- pass correct description
                      levels: levels,
                      games: games,
                      coins: coins,
                    ),
                  ),
                );
              }
            : null,
        child: Opacity(
          opacity: isUnlocked ? 1.0 : 0.5,
          child: PointyHexagonWithBottomBorder(
            width: 55.55555,
            height: 60.55555,
            color:
                isUnlocked ? const Color(0xFFFFE975) : const Color(0xFFD1D1D6),
            borderColor:
                isUnlocked ? const Color(0xFFDF7600) : const Color(0xFF7A7A7A),
            borderWidth: 5.0,
            child: Image.asset(
              "lib/assets/images/material-symbols_hive-rounded2.png",
              width: 28.3333,
              height: 28.3333,
            ),
          ),
        ),
      );
    }

    // Example: Only unlock hexagons up to completedLevel/completedStage
    // You may need to adjust this logic for your grid
    bool isUnlocked = (level < completedLevel) ||
        (level == completedLevel && /* stageIndex */ 0 <= completedStage);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildHexagon(0),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildHexagon(1),
                  const SizedBox(height: 60),
                  buildHexagon(2),
                ],
              ),
              const SizedBox(width: 35),
              Container(
                width: 80,
                height: 140,
                child: Image.asset(
                  "lib/assets/images/budgeting bee pose 1 1.png",
                  width: 80,
                  height: 140,
                ),
              ),
              const SizedBox(width: 35),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildHexagon(3),
                  const SizedBox(height: 50),
                  buildHexagon(4),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          buildHexagon(5),
        ],
      ),
    );
  }
}
