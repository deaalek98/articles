part of 'articles_main_bloc.dart';

@immutable
abstract class ArticlesMainState {}

class ArticlesMainInitial extends ArticlesMainState {}

/// State when success get articles
class ArticlesMainLoadingState extends ArticlesMainState {}

class ArticlesMainSuccessState extends ArticlesMainState {
  final List<ArticleModel> listArticles;
  final List<ArticleModel> slider;

  ArticlesMainSuccessState({required this.listArticles, required this.slider});
}

class ArticlesMainFailureState extends ArticlesMainState {
  final String message;

  ArticlesMainFailureState(this.message);
}
