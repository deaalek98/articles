part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

/// Event for search
class SearchDataEvent extends SearchEvent {
  final List<ArticleModel> listArticle;
  final String searchText;

  SearchDataEvent({required this.listArticle, required this.searchText});

}
