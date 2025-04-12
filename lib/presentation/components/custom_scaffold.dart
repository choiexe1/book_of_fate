import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  final String? backgroundImage;
  final PreferredSizeWidget? appBar;
  final BoxFit backgroundFit;
  final ColorFilter? colorFilter;
  static const String defaultBackgroundPath = 'assets/images/bg.png';

  const CustomScaffold({
    super.key,
    required this.body,
    this.backgroundImage,
    this.appBar,
    this.backgroundFit = BoxFit.cover,
    this.colorFilter,
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
                colorFilter != null
                    ? ColorFiltered(
                      colorFilter: colorFilter!,
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
}
