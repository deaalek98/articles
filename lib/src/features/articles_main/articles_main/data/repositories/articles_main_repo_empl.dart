import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/usecases/articles_data_usecase.dart';
import 'package:dartz/dartz.dart';

import 'package:articles/src/core/core.dart';
import '../../domain/repositories/articles_main_repository.dart';
import '../data_sources/articles_main_api.dart';

class ArticlesMainRepositoryImpl extends ArticlesMainRepository {
  final ArticlesMainApi articlesMainApi;

  ArticlesMainRepositoryImpl(this.articlesMainApi);

  @override
  Future<Either<Failure, List<ArticleModel>>> getArticlesData(
      {required ArticlesDataParams params}) async {
    try {
      final result = await articlesMainApi.getArticlesData(params: params);
      return result.fold((l) {
        return Left(ServerFailure(l.errorMessage,  ));
      }, (r) {
        return Right(r);
      });
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message,statusCode:  e.statusCode));
    }
  }
}
