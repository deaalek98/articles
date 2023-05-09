import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:dartz/dartz.dart';
import 'package:articles/src/core/core.dart';

class SearchDataUseCase extends UseCase<List<ArticleModel>, SearchParams> {
  SearchDataUseCase();

  @override
  Future<Either<Failure, List<ArticleModel>>> call(SearchParams params) async {
    return await Right(params.listArticle.where((element) {
      if (element.title?.toLowerCase().contains(params.searchText.toLowerCase()) ?? false) {
        return true;
      }else     if (element.adxKeywords?.toLowerCase().contains(params.searchText.toLowerCase()) ?? false) {
        return true;
      }else     if (element.abstract?.toLowerCase().contains(params.searchText.toLowerCase()) ?? false) {
        return true;
      }
      return false;
    }).toList());
  }
}

class SearchParams {
  final List<ArticleModel> listArticle;
  final String searchText;

  SearchParams({required this.listArticle, required this.searchText});
}
