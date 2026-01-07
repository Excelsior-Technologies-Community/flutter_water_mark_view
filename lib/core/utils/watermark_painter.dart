import 'package:flutter/material.dart';

class WatermarkPainter extends CustomPainter {
  final String text;
  final TextStyle style;
  final double rotation;
  final double opacity;

  WatermarkPainter({
    required this.text,
    required this.style,
    required this.rotation,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    canvas.save();
    canvas.rotate(rotation);

    for (double x = -size.height; x < size.width * 2; x += 200) {
      for (double y = -size.width; y < size.height * 2; y += 120) {
        textPainter.paint(
          canvas,
          Offset(x, y),
        );
      }
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
