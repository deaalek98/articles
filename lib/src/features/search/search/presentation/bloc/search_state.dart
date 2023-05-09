part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

/// State when success Search
class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<ArticleModel> listAResult;

  SearchSuccessState(this.listAResult);
}

class SearchFailureState extends SearchState {
  final String message;

  SearchFailureState(this.message);
}
