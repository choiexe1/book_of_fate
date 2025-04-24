import 'dart:convert';

import 'package:book_of_fate/data/data_source/answer_data_source.dart';
import 'package:book_of_fate/domain/model/answer.dart';

class MockAnswerDataSource implements AnswerDataSource {
  final String jsonString;

  MockAnswerDataSource(this.jsonString);

  @override
  Future<List<Answer>> load() async {
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList
        .whereType<Map<String, dynamic>>()
        .map((e) => Answer.fromJson(e))
        .toList();
  }
}
