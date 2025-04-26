import 'package:book_of_fate/domain/model/answer.dart';
import 'package:book_of_fate/domain/repository/answer_repository.dart';

class GetRandomAnswerUseCase {
  final AnswerRepository _answerRepository;

  const GetRandomAnswerUseCase(this._answerRepository);

  Future<Answer> execute() async {
    return await _answerRepository.findByRandom();
  }
}
