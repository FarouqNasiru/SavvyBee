import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/hexagon_container.dart';
import 'package:savvybee/home_screen_budgeting.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    Widget buildStars(int count, bool isUnlocked, int i) {
      // Arrange stars in multiple rows to fit within hexagon
      final starCount = i + 1;
      List<Widget> starRows = [];

      if (count <= 3) {
        // 1-3 stars: single row
        starRows.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              count,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                child: SvgPicture.asset(
                  'lib/assets/images/solar_star-bold.svg',
                  width: 6,
                  height: 6,
                  colorFilter: ColorFilter.mode(((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ?  Colors.black // bright yellow for completed
                      : isUnlocked ? Colors.black : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (count == 4) {
        // 4 stars: 2 rows of 2
        starRows.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                child: SvgPicture.asset(
                  'lib/assets/images/solar_star-bold.svg',
                  width: 6,
                  height: 6,
                  colorFilter: ColorFilter.mode(
                   ((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ?  Colors.black // bright yellow for completed
                      : isUnlocked ? Colors.black : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        );
        starRows.add(const SizedBox(height: 0.2));
        starRows.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              1,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                child: SvgPicture.asset(
                  'lib/assets/images/solar_star-bold.svg',
                  width: 6,
                  height: 6,
                  colorFilter: ColorFilter.mode(
                   ((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ?  Colors.black // bright yellow for completed
                      : isUnlocked ? Colors.black : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (count == 5) {
        // 5 stars: 2 rows (3 + 2)
        starRows.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                child: SvgPicture.asset(
                  'lib/assets/images/solar_star-bold.svg',
                  width: 6,
                  height: 6,
                  colorFilter: ColorFilter.mode(
                    ((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ?  Colors.black // bright yellow for completed
                      : isUnlocked ? Colors.black : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        );
        starRows.add(const SizedBox(height: 0.2));
        starRows.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              2,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                child: SvgPicture.asset(
                  'lib/assets/images/solar_star-bold.svg',
                  width: 6,
                  height: 6,
                  colorFilter: ColorFilter.mode(
                    ((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ?  Colors.black // bright yellow for completed
                      : isUnlocked ? Colors.black : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (count == 6) {
        // 6 stars: 2 rows of 3
        starRows.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                child: SvgPicture.asset(
                  'lib/assets/images/solar_star-bold.svg',
                  width: 5,
                  height: 5,
                  colorFilter: ColorFilter.mode(
                    ((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ?  Colors.black // bright yellow for completed
                      : isUnlocked ? Colors.black : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        );
        starRows.add(const SizedBox(height: 0.2));
        starRows.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                child: SvgPicture.asset(
                  'lib/assets/images/solar_star-bold.svg',
                  width: 5,
                  height: 5,
                  colorFilter: ColorFilter.mode(
                    ((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ?  Colors.black // bright yellow for completed
                      : isUnlocked ? Colors.black : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: starRows,
      );
    }

    Widget buildHexagon(int i, {Color? color, Color? borderColor}) {
      final stageKey = hexagonData[i]['stageKey']!;
      final isUnlocked = isStageUnlocked(level, i);
      final starCount = i + 1; // Progressive stars: 1, 2, 3, 4, 5, 6

      return GestureDetector(
        onTap: ((level < completedLevel) ||
                (level == completedLevel && i <= completedStage) ||
                isUnlocked)
            ? () {
                // Show popup for hexagon 6 in Savings or Numeracy
                if ((category.toLowerCase() == 'savings' ||
                        category.toLowerCase() == 'numeracy') &&
                    i == 5) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Coming Soon'),
                      content: const Text(
                          'Bonus level for this stage is coming soon'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreenBudgeting(
                        category: category,
                        level: level,
                        stageKey: hexagonData[i]['stageKey']!,
                        title: hexagonData[i]['title']!,
                        description: hexagonData[i]['description']!,
                        levels: levels,
                        games: games,
                        coins: coins,
                      ),
                    ),
                  );
                }
              }
            : null,
        child: SizedBox(
          width: 60,
          height: 65,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background hexagon (Polygon 6) - slightly offset for border effect
              Positioned(
                top: 3,
                child: Image.asset(
                  'lib/assets/images/Polygon_6.png',
                  width: 55.556,
                  height: 55.556,
                  color: ((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ? const Color(0xFFDF7600) // bright yellow for completed
                      : isUnlocked
                      ? const Color(0xFFDF7600)
                      : const Color.fromARGB(255, 122, 122, 122),
                ),
              ),
              // Main hexagon (Polygon 1)
              Positioned(
                top: 0,
                child: Image.asset(
                  'lib/assets/images/Polygon_1.png',
                  width: 55.556,
                  height: 55.556,
                  color: ((level < completedLevel) ||
                          (level == completedLevel && i <= completedStage))
                      ? const Color.fromARGB(255, 255, 233, 117) // bright yellow for completed
                      : isUnlocked
                          ? const Color.fromARGB(255, 255, 233, 117) // bright yellow for unlocked
                          : const Color.fromARGB(255, 209, 209, 214), // grey for locked
                ),
              ),
              // Icon in the center - different for each hexagon
              Positioned(
                top: 13,
                child: _buildHexagonIcon(i),
              ),
              // Stars at the bottom - now in multiple rows
              Positioned(
                bottom: 15,
                child: buildStars(starCount, isUnlocked, i),
              ),
            ],
          ),
        ),
      );
    }

    bool isUnlocked = (level < completedLevel) ||
        (level == completedLevel && /* stageIndex */ 0 <= completedStage);

    return Center(
      child: Container(
        width: 239.556,
        height: 291,
        child: Stack(
          children: [
            // Center image - positioned in the middle
            Positioned(
              top: 30,
              left: 30,
              right: 30,
              bottom: 30,
              child: Center(
                child: _buildCenterImage(),
              ),
            ),
            // Hexagon 0 - top
            Positioned(
              top: 0,
              left: 90,
              child: buildHexagon(0),
            ),
            // Hexagon 1 - top left
            Positioned(
              top: 55,
              left: 0,
              child: buildHexagon(1),
            ),
            // Hexagon 2 - bottom left
            Positioned(
              top: 175,
              left: 0,
              child: buildHexagon(2),
            ),
            // Hexagon 3 - top right
            Positioned(
              top: 55,
              right: 0,
              child: buildHexagon(3),
            ),
            // Hexagon 4 - bottom right
            Positioned(
              top: 175,
              right: 0,
              child: buildHexagon(4),
            ),
            // Hexagon 5 - bottom
            Positioned(
              bottom: 0,
              left: 90,
              child: buildHexagon(5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterImage() {
    String imagePath = '';
    double imageWidth = 140;
    double imageHeight = 180;

    // Determine image path and size based on category and level
    switch (category.toLowerCase()) {
      case 'budgeting':
        switch (level) {
          case 0:
            imagePath = 'lib/assets/images/budgeting bee pose 1 5.png';
            imageWidth = 180;
            imageHeight = 245;
            break;
          case 1:
            imagePath = 'lib/assets/images/budgeting bee pose 1 4.png';
            imageWidth = 180;
            imageHeight = 245;
            break;
          case 2:
            imagePath = 'lib/assets/images/budgeting bee pose 1 5.png';
            imageWidth = 180;
            imageHeight = 245;
            break;
          case 3:
          case 4:
            imagePath = 'lib/assets/images/budgeting bee pose 1 4.png';
            imageWidth = 180;
            imageHeight = 245;
            break;
          default:
            imagePath = 'lib/assets/images/budgeting bee pose 1 4.png';
            imageWidth = 180;
            imageHeight = 250;
        }
        break;

      case 'savings':
        switch (level) {
          case 0:
            imagePath = 'lib/assets/images/budgeting bee pose 1 6.png';
            imageWidth = 165;
            imageHeight = 240;
            break;
          case 1:
            imagePath = 'lib/assets/images/budgeting bee pose 1 7.png';
           imageWidth = 165;
            imageHeight = 240;
            break;
          case 2:
            imagePath = 'lib/assets/images/budgeting bee pose 1 8.png';
            imageWidth = 165;
            imageHeight = 240;
            break;
          case 3:
            imagePath = 'lib/assets/images/budgeting bee pose 1 3.png';
            imageWidth = 140;
            imageHeight = 200;
            break;
          case 4:
            imagePath = 'lib/assets/images/budgeting bee pose 1 2.png';
            imageWidth = 140;
            imageHeight = 200;
            break;
          default:
            imagePath = 'lib/assets/images/budgeting bee pose 1 8.png';
            imageWidth = 140;
            imageHeight = 200;
        }
        break;

      case 'numeracy':
        switch (level) {
          case 0:
            imagePath = 'lib/assets/images/budgeting bee pose 20.png';
            imageWidth = 110;
            imageHeight = 160;
            break;
          case 1:
            imagePath = 'lib/assets/images/budgeting bee pose 21.png';
            imageWidth = 110;
            imageHeight = 160;
            break;
          case 2:
            imagePath = 'lib/assets/images/budgeting bee pose 22.png';
           imageWidth = 110;
            imageHeight = 160;
            break;
          case 3:
            imagePath = 'lib/assets/images/budgeting bee pose 23.png';
            imageWidth = 135;
            imageHeight = 180;
            break;
          case 4:
            imagePath = 'lib/assets/images/budgeting bee pose 24.png';
            imageWidth = 150;
            imageHeight = 220;
            break;
          default:
            imagePath = 'lib/assets/images/budgeting bee pose 1 1.png';
            imageWidth = 140;
            imageHeight = 200;
        }
        break;

      default:
        imagePath = 'lib/assets/images/budgeting bee pose 1 1.png';
        imageWidth = 140;
        imageHeight = 200;
    }

    // Use Image.asset for PNG files with direct width and height
    return Image.asset(
      imagePath,
      width: imageWidth,
      height: imageHeight,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // Fallback to default image if the specified image doesn't exist
        return Image.asset(
          'lib/assets/images/budgeting bee pose 1 1.png',
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.contain,
        );
      },
    );
  }


  Widget _buildHexagonIcon(int hexagonIndex) {
    // Determine if this hexagon is unlocked or completed
    bool isUnlocked = isStageUnlocked(level, hexagonIndex);
    bool isCompleted = (level < completedLevel) ||
        (level == completedLevel && hexagonIndex <= completedStage);
    
    // Use black color for unlocked/completed hexagons, white for locked ones
    Color iconColor = (isUnlocked || isCompleted) ? Colors.black : const Color.fromARGB(255, 255, 255, 255);
    
    switch (hexagonIndex) {
      case 0:
        // First hexagon - material-symbols_hive-rounded.svg
        return SvgPicture.asset(
          'lib/assets/images/material-symbols_hive-rounded.svg',
          width: 28.333,
          height: 28.333,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcATop,
          ),
        );
      case 1:
        // Second hexagon - cave.png
        return Image.asset(
          'lib/assets/images/cave.png',
          width: 28.333,
          height: 28.333,
          color: iconColor,
        );
      case 2:
        // Third hexagon - bumblebee.png
        return Image.asset(
          'lib/assets/images/bumblebee.png',
          width: 28.333,
          height: 28.333,
          color: iconColor,
        );
      case 3:
        // Fourth hexagon - swarm.png
        return Image.asset(
          'lib/assets/images/swarm.png',
          width: 28.333,
          height: 28.333,
          color: iconColor,
        );
      case 4:
        // Fifth hexagon - beehive_svgrepo.com.png
        return Image.asset(
          'lib/assets/images/beehive_svgrepo.com.png',
          width: 28.333,
          height: 28.333,
          color: iconColor,
        );
      case 5:
        // Sixth hexagon - honey.png
        return Image.asset(
          'lib/assets/images/honey.png',
          width: 28.333,
          height: 28.333,
          color: iconColor,
        );
      default:
        // Fallback to hive icon
        return SvgPicture.asset(
          'lib/assets/images/material-symbols_hive-rounded.svg',
          width: 28.333,
          height: 28.333,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcATop,
          ),
        );
    }
  }

  bool isStageUnlocked(int levelIndex, int stageIndex) {
    if (levelIndex == 0 && stageIndex == 0) {
      // Only unlock the very first stage
      return completedLevel == 0 && completedStage == 0;
    }
    if (levelIndex < completedLevel) {
      // All stages in previous levels are unlocked
      return true;
    }
    if (levelIndex == completedLevel) {
      // Only unlock up to and including completedStage
      return stageIndex <= completedStage;
    }
    // For next level, only unlock first stage if all stages in previous level are completed
    if (levelIndex == completedLevel + 1 && completedStage == 5) {
      return stageIndex == 0;
    }
    return false;
  }
}
