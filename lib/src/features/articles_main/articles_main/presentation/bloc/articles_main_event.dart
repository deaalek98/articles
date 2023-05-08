part of 'articles_main_bloc.dart';

@immutable
abstract class ArticlesMainEvent {}

/// Event to get articles
class ArticlesMainDataEvent extends ArticlesMainEvent {
  final int numDays;

  ArticlesMainDataEvent(this.numDays);
}
