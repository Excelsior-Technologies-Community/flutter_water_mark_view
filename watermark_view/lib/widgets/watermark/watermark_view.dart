import 'package:flutter/material.dart';
import '../../core/enums/watermark_position.dart';
import '../../core/enums/watermark_mode.dart';
import '../../core/enums/watermark_type.dart';
import '../../core/constants/watermark_defaults.dart';
import 'watermark_text.dart';

class WaterMarkView extends StatelessWidget {
  final Widget child;

  /// TYPE
  final WatermarkType type;

  /// TEXT
  final String? watermarkText;

  /// IMAGE
  final ImageProvider? watermarkImage;
  final double imageWidth;
  final double imageHeight;

  /// MODE
  final WatermarkMode mode;

  /// SINGLE
  final WatermarkPosition position;

  /// COMMON
  final double opacity;
  final double rotation;
  final TextStyle? textStyle;

  /// TILED
  final double spacing;
  final double runSpacing;

  const WaterMarkView({
    super.key,
    required this.child,

    /// type
    this.type = WatermarkType.text,

    /// text
    this.watermarkText,

    /// image
    this.watermarkImage,
    this.imageWidth = 80,
    this.imageHeight = 80,

    /// mode
    this.mode = WatermarkMode.single,

    /// position
    this.position = WatermarkPosition.center,

    /// common
    this.opacity = WatermarkDefaults.opacity,
    this.rotation = WatermarkDefaults.rotation,
    this.textStyle,

    /// tiled
    this.spacing = 60,
    this.runSpacing = 40,
  });

  Alignment _alignment() {
    switch (position) {
      case WatermarkPosition.topLeft:
        return Alignment.topLeft;
      case WatermarkPosition.topRight:
        return Alignment.topRight;
      case WatermarkPosition.bottomLeft:
        return Alignment.bottomLeft;
      case WatermarkPosition.bottomRight:
        return Alignment.bottomRight;
      case WatermarkPosition.center:
      default:
        return Alignment.center;
    }
  }

  Widget _buildWatermarkItem() {
    if (type == WatermarkType.image) {
      return Opacity(
        opacity: opacity,
        child: Image(
          image: watermarkImage!,
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.contain,
        ),
      );
    }

    return WatermarkText(
      text: watermarkText ?? '',
      rotation: 0,
      opacity: opacity,
      style: textStyle ??
          const TextStyle(
            fontSize: WatermarkDefaults.fontSize,
            color: WatermarkDefaults.color,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _singleWatermark() {
    return Align(
      alignment: _alignment(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Transform.rotate(
          angle: rotation,
          child: _buildWatermarkItem(),
        ),
      ),
    );
  }

  Widget _tiledWatermark() {
    return Transform.rotate(
      angle: rotation,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final count =
          ((constraints.maxWidth * constraints.maxHeight) / 8000)
              .ceil();

          return Wrap(
            spacing: spacing,
            runSpacing: runSpacing,
            children:
            List.generate(count, (_) => _buildWatermarkItem()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: IgnorePointer(
            child: mode == WatermarkMode.single
                ? _singleWatermark()
                : _tiledWatermark(),
          ),
        ),
      ],
    );
  }
}
