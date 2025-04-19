import 'package:flutter/material.dart';

abstract class AppFont {
  static const String pretendard = 'Pretendart';

  static const TextStyle regular = TextStyle(
    fontFamily: pretendard,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle semiBold = TextStyle(
    fontFamily: pretendard,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: pretendard,
    fontWeight: FontWeight.w700,
  );
}
