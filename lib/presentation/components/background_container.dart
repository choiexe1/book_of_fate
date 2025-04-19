import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final String backgroundImage;
  final double exposure;
  final Widget child;
  final Alignment alignment;

  const BackgroundContainer({
    super.key,
    required this.child,
    this.exposure = 1.5,
    this.backgroundImage = 'assets/images/bg.png',
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          colorFilter: buildColorFilter(exposure),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }

  ColorFilter buildColorFilter(double exposure) {
    return ColorFilter.matrix([
      exposure,
      0,
      0,
      0,
      0,
      0,
      exposure,
      0,
      0,
      0,
      0,
      0,
      exposure,
      0,
      0,
      0,
      0,
      0,
      exposure,
      0,
    ]);
  }
}
