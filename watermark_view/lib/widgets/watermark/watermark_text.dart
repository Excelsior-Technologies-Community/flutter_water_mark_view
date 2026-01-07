import 'package:flutter/material.dart';

class WatermarkText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double rotation;
  final double opacity;

  const WatermarkText({
    super.key,
    required this.text,
    required this.style,
    required this.rotation,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: rotation,
        child: Text(text, style: style),
      ),
    );
  }
}
