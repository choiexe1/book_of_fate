import 'package:book_of_fate/domain/model/answer.dart';
import 'package:book_of_fate/domain/repository/repository.dart';

abstract interface class AnswerRepository implements Repository<Answer, int> {
  Future<Answer> findByRandom();
}
