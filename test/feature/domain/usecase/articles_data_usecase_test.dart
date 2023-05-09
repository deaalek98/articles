import 'package:articles/src/features/articles_main/articles_main/data/repositories/articles_main_repo_empl.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/repositories/articles_main_repository.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/usecases/articles_data_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// import 'package:mockito/mockito.dart';

import '../../../data_mock/data_articles.dart';
import 'articles_data_usecase_test.mocks.dart';

// class MockNewsRepository extends Mock implements ArticlesMainRepository {}

@GenerateMocks([
  ArticlesMainRepository
], customMocks: [
  MockSpec<ArticlesMainRepository>(
      as: #MockCatRelaxed, returnNullOnMissingStub: true),
])
void main() {
  late MockArticlesMainRepository mockNewsRepository;
  late ArticlesDataUseCase articlesDataUseCase;

  setUp(() {
    mockNewsRepository = MockArticlesMainRepository();
    articlesDataUseCase = ArticlesDataUseCase(mockNewsRepository);
  });

  test(
    'make sure that NewsRepository successfully gets a successful or failed response from the articlesMainRepositoryImpl '
    'endpoint',
    () async {
      // arrange

      ArticlesDataParams params = ArticlesDataParams(1);
      when(mockNewsRepository.getArticlesData(params: params)).thenAnswer(
        (realInvocation) async {
          return Right(listResponseTest);
        },
      );

      // act
      final result = await articlesDataUseCase.call(params);

      // assert
      expect(result, Right(listResponseTest));
      // verify(mockNewsRepository.getTopHeadlinesNews(tCategory));
      // verifyNoMoreInteractions(mockNewsRepository);
    },
  );
}
