import 'package:flutter/material.dart';

abstract class AppFont {
  static const String _pretendard = 'Pretendart';

  static const TextStyle regular = TextStyle(
    fontFamily: _pretendard,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle semiBold = TextStyle(
    fontFamily: _pretendard,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: _pretendard,
    fontWeight: FontWeight.w700,
  );
}
