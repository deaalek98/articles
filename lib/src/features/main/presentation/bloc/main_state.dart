part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

/// State when success get transaction
class MainLoadingState extends MainState {}

/// State when success get transaction
class MainSuccessState extends MainState {

  MainSuccessState();
}

/// State when failure get transaction
class MainFailureState extends MainState {
  final String message;

  MainFailureState(this.message);
}
