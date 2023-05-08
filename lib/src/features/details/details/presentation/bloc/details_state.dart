part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

/// State when success get transaction
class DetailsLoadingState extends DetailsState {}

/// State when success get transaction
class DetailsSuccessState extends DetailsState {

  DetailsSuccessState();
}

/// State when failure get transaction
class DetailsFailureState extends DetailsState {
  final String message;

  DetailsFailureState(this.message);
}
