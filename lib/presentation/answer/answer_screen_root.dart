import 'package:book_of_fate/core/routes.dart';
import 'package:book_of_fate/presentation/answer/answer_action.dart';
import 'package:book_of_fate/presentation/answer/answer_screen.dart';
import 'package:book_of_fate/presentation/answer/answer_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AnswerScreenRoot extends StatefulWidget {
  final AnswerScreenViewModel viewModel;

  const AnswerScreenRoot({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _AnswerScreenRootState();
}

class _AnswerScreenRootState extends State<AnswerScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getRandomAnswer();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return AnswerScreen(
          state: widget.viewModel.state,
          onAction: (action) {
            switch (action) {
              case NavigateToHome():
                context.go(Routes.home);
                break;
              case GetRandomAnswer():
                widget.viewModel.onAction(action);
                break;
            }
          },
        );
      },
    );
  }
}
