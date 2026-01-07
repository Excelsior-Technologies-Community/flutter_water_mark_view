import 'package:flutter/material.dart';
import 'package:flutter_water_mark_view/core/enums/watermark_mode.dart';
import 'package:flutter_water_mark_view/core/enums/watermark_type.dart';
import '../widgets/watermark/watermark_view.dart';
import '../core/enums/watermark_position.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WaterMarkView Demo')),
      body: Center(
        child: WaterMarkView(
          type: WatermarkType.text,
          position: WatermarkPosition.center,
          runSpacing: 6,
          spacing: 20,
          watermarkText: 'Content',
          // watermarkImage: const NetworkImage(
          //   "https://upload.wikimedia.org/wikipedia/commons/a/ab/Logo_TV_2015.png",
          // ),
          mode: WatermarkMode.single,
          rotation: -0.3,
          opacity: 0.8,
          // imageWidth: 70,
          // imageHeight: 70,
          child: Image.network("https://picsum.photos/400"),
        ),
      ),
    );
  }
}
