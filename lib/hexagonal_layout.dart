import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';


class HexagonalLayout extends StatelessWidget {
  final Widget centerWidget;
  final List<Widget> surroundingHexagons;
  final double radius;
  final double hexagonSize;

  const HexagonalLayout({
    required this.centerWidget,
    required this.surroundingHexagons,
    this.radius = 150,
    this.hexagonSize = 80,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(surroundingHexagons.length == 6, 'Exactly 6 surrounding hexagons are required');

    return Stack(
      alignment: Alignment.center,
      children: [
        centerWidget,
        ...List.generate(6, (index) {
          final angle = (index * 2 * pi / 6) + pi / 2;
          return Positioned(
            left: radius * cos(angle),
            top: radius * sin(angle),
            child: Transform.rotate(
              angle: angle,
              child: surroundingHexagons[index],
            ),
          );
        }),
      ],
    );
  }
}