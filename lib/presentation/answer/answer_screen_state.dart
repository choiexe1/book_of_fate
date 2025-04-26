import 'package:book_of_fate/domain/model/answer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_screen_state.freezed.dart';

@freezed
abstract class AnswerScreenState with _$AnswerScreenState {
  const factory AnswerScreenState({
    @Default(false) bool isLoading,
    @Default(null) Answer? answer,
  }) = _AnswerScreenState;
}
