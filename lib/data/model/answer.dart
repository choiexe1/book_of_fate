import 'package:book_of_fate/data/model/language.dart';
import 'package:book_of_fate/data/model/tag.dart';

class Answer {
  final int id;
  final String text;
  final Tag tag;

  const Answer({required this.id, required this.text, required this.tag});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      text: json['text'],
      tag: Tag.fromName(json['tag']),
    );
  }

  Map<String, dynamic> toJson(Language language) {
    return {'id': id, 'text': text, 'tag': tag.toJson(language)};
  }
}
