import 'package:book_of_fate/data/use_case/get_random_answer_use_case.dart';
import 'package:book_of_fate/domain/model/answer.dart';
import 'package:book_of_fate/presentation/answer/answer_action.dart';
import 'package:book_of_fate/presentation/answer/answer_screen_state.dart';
import 'package:flutter/foundation.dart';

class AnswerScreenViewModel with ChangeNotifier {
  AnswerScreenState _state = AnswerScreenState();
  final GetRandomAnswerUseCase _getRandomAnswerUseCase;

  AnswerScreenViewModel({
    required GetRandomAnswerUseCase getRandomAnswerUseCase,
  }) : _getRandomAnswerUseCase = getRandomAnswerUseCase;

  AnswerScreenState get state => _state;
  bool get isLoading => _state.isLoading;

  void onAction(AnswerAction action) {
    switch (action) {
      case NavigateToHome():
    }
  }

  Future<void> getRandomAnswer() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Answer answer = await _getRandomAnswerUseCase.execute();

    _state = _state.copyWith(answer: answer, isLoading: false);
    notifyListeners();
  }
}
