import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatter;

  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.inputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: inputFormatter ?? [],
      textAlign: TextAlign.center,
      style: AppFont.regular.copyWith(color: AppColor.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.deepNavy.withAlpha(200),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.lavender),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.gold),
          borderRadius: BorderRadius.circular(12.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        hintStyle: AppFont.regular.copyWith(
          color: AppColor.white.withAlpha(170),
        ),
        hintText: hintText,
      ),
    );
  }
}
