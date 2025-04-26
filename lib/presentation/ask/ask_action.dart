import 'package:freezed_annotation/freezed_annotation.dart';

part 'ask_action.freezed.dart';

@freezed
sealed class AskAction with _$AskAction {
  const factory AskAction.navigateToAnswer() = NavigateToAnswer;
}
