import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/usecases/articles_data_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:articles/src/core/core.dart';

class ArticlesMainApi {
  Future<Either<Failure, List<ArticleModel>>> getArticlesData(
      {required ArticlesDataParams params}) async {
    try {
      final result = (await sl<Dio>().get(
        "all-sections/${params.numDays}.json?api-key=$API_KEY",
      ))
          .data;
      List<dynamic>? bodyList = result?["results"];
      List<ArticleModel> list = [];
      bodyList?.forEach((element) {
        list.add(ArticleModel.fromJson(element));
      });
      // BalanceInfoModel.fromJson(body)
      return Right(list);
    } on DioError catch (e) {
      return Left(ServerFailure(handleDioError(e), statusCode: e.response?.statusCode)) ;
    } catch (e) {
      return Left(ServerFailure(e.toString(),  )) ;
    }
  }
}
