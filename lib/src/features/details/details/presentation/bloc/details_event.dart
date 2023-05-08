part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

/// Event to get transaction
class DetailsDataEvent extends DetailsEvent {
  final int id;
DetailsDataEvent({required this.id});
}



