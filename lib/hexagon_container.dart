import 'package:flutter/material.dart';

class PointyHexagonWithBottomBorder extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget? child;
  final Color borderColor;
  final double borderWidth;

  const PointyHexagonWithBottomBorder({
    required this.width,
    required this.height,
    required this.color,
    this.child,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HexagonWithBottomBorderPainter(
        color: color,
        borderColor: borderColor,
        borderWidth: borderWidth,
      ),
      child: ClipPath(
        clipper: _PointyHexagonClipper(),
        child: Container(
          width: width,
          height: height,
          color: color,
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _HexagonWithBottomBorderPainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final double borderWidth;

  _HexagonWithBottomBorderPainter({
    required this.color,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = _createHexagonPath(size);
    
    // Draw main hexagon
    final fillPaint = Paint()..color = color;
    canvas.drawPath(path, fillPaint);
    
    // Draw bottom border only
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    
    final borderPath = Path();
    borderPath.moveTo(size.width, size.height * 0.75);
    borderPath.lineTo(size.width / 2, size.height);
    borderPath.lineTo(0, size.height * 0.75);
    
    canvas.drawPath(borderPath, borderPaint);
  }

  Path _createHexagonPath(Size size) {
    final path = Path();
    path.moveTo(size.width/2, 0);
    path.lineTo(size.width, size.height*0.25);
    path.lineTo(size.width, size.height*0.75);
    path.lineTo(size.width/2, size.height);
    path.lineTo(0, size.height*0.75);
    path.lineTo(0, size.height*0.25);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}



class _PointyHexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0); // Top point
    path.lineTo(size.width, size.height * 0.25); // Top-right
    path.lineTo(size.width, size.height * 0.75); // Bottom-right
    path.lineTo(size.width / 2, size.height); // Bottom point
    path.lineTo(0, size.height * 0.75); // Bottom-left
    path.lineTo(0, size.height * 0.25); // Top-left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
