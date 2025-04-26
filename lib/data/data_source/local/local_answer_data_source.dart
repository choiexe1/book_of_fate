import 'dart:convert';

import 'package:book_of_fate/data/data_source/answer_data_source.dart';
import 'package:book_of_fate/domain/model/answer.dart';
import 'package:flutter/services.dart';

class LocalAnswerDataSource implements AnswerDataSource {
  final String _filePath = 'assets/answers.json';

  @override
  Future<List<Answer>> load() async {
    final String json = await rootBundle.loadString(_filePath);
    final dynamic decoded = jsonDecode(json);

    return decoded
        .whereType<Map<String, dynamic>>()
        .map((json) => Answer.fromJson(json))
        .toList();
  }
}
