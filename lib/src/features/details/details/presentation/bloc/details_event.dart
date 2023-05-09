part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

/// Event to get Data
class DetailsDataEvent extends DetailsEvent {
  final int id;
DetailsDataEvent({required this.id});
}



