import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget body;

  final String? backgroundImage;
  final PreferredSizeWidget? appBar;
  final BoxFit backgroundFit;
  final double? exposure;
  static const String defaultBackgroundPath = 'assets/images/bg.png';

  const BackgroundScaffold({
    super.key,
    required this.body,
    this.backgroundImage,
    this.appBar,
    this.backgroundFit = BoxFit.cover,
    this.exposure,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child:
                exposure != null
                    ? ColorFiltered(
                      colorFilter: buildColorFilter(exposure!),
                      child: Image.asset(
                        backgroundImage ?? defaultBackgroundPath,
                        fit: backgroundFit,
                        errorBuilder: (context, error, stackTrace) {
                          return Container();
                        },
                      ),
                    )
                    : Image.asset(
                      backgroundImage ?? defaultBackgroundPath,
                      fit: backgroundFit,
                    ),
          ),
          Positioned.fill(child: body),
        ],
      ),
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
      1,
      0,
    ]);
  }
}
