import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_action.freezed.dart';

@freezed
sealed class AnswerAction with _$AnswerAction {
  const factory AnswerAction.navigateToHome() = NavigateToHome;
}
