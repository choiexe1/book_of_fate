import 'package:book_of_fate/data/data_source/answer_data_source.dart';
import 'package:book_of_fate/domain/model/answer.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/data_source/mock_answer_data_source.dart';

void main() {
  late final AnswerDataSource dataSource;

  setUp(() {
    dataSource = MockAnswerDataSource(
      '[{"id": 1, "text": "Answer 1"}, {"id": 2, "text": "Answer 2"}]',
    );
  });

  test('데이터소스 load() 호출 시 문자열 형태의 JSON을 List<Answer> 형태로 반환해야한다.', () async {
    final List<Answer> answers = await dataSource.load();

    expect(answers, isA<List<Answer>>());
    expect(answers.length, equals(2));
    expect(answers[0].id, equals(1));
    expect(answers[0].text, equals('Answer 1'));
    expect(answers[1].id, equals(2));
    expect(answers[1].text, equals('Answer 2'));
  });
}
