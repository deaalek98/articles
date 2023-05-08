part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class Connected extends ConnectivityState {}

class NotConnected extends ConnectivityState {}
