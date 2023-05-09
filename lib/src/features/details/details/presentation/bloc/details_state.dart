part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

/// State when success get data
class DetailsLoadingState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
  DetailsSuccessState();
}

class DetailsFailureState extends DetailsState {
  final String message;

  DetailsFailureState(this.message);
}
