import 'package:book_of_fate/data/model/language.dart';

enum Tag {
  positive,
  negative,
  hopeful,
  neutral;

  factory Tag.fromName(String name) {
    switch (name) {
      case '긍정':
        return Tag.positive;
      case '부정':
        return Tag.negative;
      case '희망':
        return Tag.hopeful;
      case '중립':
        return Tag.neutral;
      case 'positive':
        return Tag.positive;
      case 'negative':
        return Tag.negative;
      case 'hopeful':
        return Tag.hopeful;
      case 'neutral':
        return Tag.neutral;
      default:
        throw ArgumentError('Invalid tag name: $name');
    }
  }

  String toJson(Language language) {
    if (language == Language.kr) {
      switch (this) {
        case Tag.positive:
          return '긍정';
        case Tag.negative:
          return '부정';
        case Tag.hopeful:
          return '희망';
        case Tag.neutral:
          return '중립';
      }
    } else {
      switch (this) {
        case Tag.positive:
          return 'positive';
        case Tag.negative:
          return 'negative';
        case Tag.hopeful:
          return 'hopeful';
        case Tag.neutral:
          return 'neutral';
      }
    }
  }
}
