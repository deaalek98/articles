import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/repositories/articles_main_repository.dart';
import 'package:articles/src/features/articles_main/articles_main/presentation/pages/articles_main_page.dart';
import 'package:dartz/dartz.dart';
import 'package:articles/src/core/core.dart';

class ArticlesDataUseCase
    extends UseCase<List<ArticleModel>, ArticlesDataParams> {
  final ArticlesMainRepository repository;

  ArticlesDataUseCase(this.repository);

  @override
  Future<Either<Failure, List<ArticleModel>>> call(
      ArticlesDataParams params) async {
    return await repository.getArticlesData(params: params);
  }
}

class ArticlesDataParams {
  int numDays;

  ArticlesDataParams(this.numDays);
}
