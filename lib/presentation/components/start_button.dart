import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';
import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;

  const StartButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  State<StatefulWidget> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  bool isPressed = false;

  void notify() {
    setState(() {
      widget.onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
        widget.onPressed();
      },
      child: Container(
        width: widget.width ?? 200,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: AppColor.darkBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ColorFiltered(
          colorFilter: exposure(1.2),
          child: Text(
            widget.text,
            style: AppFont.largeTextBold.copyWith(
              color: AppColor.gold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  ColorFilter exposure(double exposure) {
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
