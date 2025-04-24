import 'package:book_of_fate/domain/model/answer.dart';

abstract interface class AnswerDataSource {
  Future<List<Answer>> load();
}
