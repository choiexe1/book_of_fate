import 'dart:math';

import 'package:book_of_fate/data/data_source/answer_data_source.dart';
import 'package:book_of_fate/domain/model/answer.dart';
import 'package:book_of_fate/domain/repository/answer_repository.dart';

class AnswerRepositoryImpl implements AnswerRepository {
  final AnswerDataSource _dataSource;

  const AnswerRepositoryImpl(this._dataSource);

  @override
  Future<List<Answer>> findAll() async {
    return await _dataSource.load();
  }

  @override
  Future<Answer?> findById(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<Answer> findByRandom() async {
    List<Answer> answers = await findAll();
    final int randomIndex = Random().nextInt(answers.length);
    return answers[randomIndex];
  }
}
