import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/usecases/articles_data_usecase.dart';
import 'package:dartz/dartz.dart';

import 'package:articles/src/core/core.dart';

abstract class ArticlesMainRepository {
  Future<Either<Failure, List<ArticleModel>>> getArticlesData({required ArticlesDataParams params});
}
