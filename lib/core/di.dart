import 'package:book_of_fate/data/data_source/answer_data_source.dart';
import 'package:book_of_fate/data/data_source/local/local_answer_data_source.dart';
import 'package:book_of_fate/data/repository/answer_repository_impl.dart';
import 'package:book_of_fate/data/use_case/get_random_answer_use_case.dart';
import 'package:book_of_fate/domain/repository/answer_repository.dart';
import 'package:book_of_fate/presentation/answer/answer_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void diSetUp() {
  _dataSources();
  _repositories();
  _useCases();
  _viewModels();
}

void _dataSources() {
  getIt.registerSingleton<AnswerDataSource>(LocalAnswerDataSource());
}

void _repositories() {
  getIt.registerSingleton<AnswerRepository>(AnswerRepositoryImpl(getIt()));
}

void _useCases() {
  getIt.registerSingleton<GetRandomAnswerUseCase>(
    GetRandomAnswerUseCase(getIt()),
  );
}

void _viewModels() {
  getIt.registerFactory(
    () => AnswerScreenViewModel(getRandomAnswerUseCase: getIt()),
  );
}
