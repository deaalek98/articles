part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityEvent {}

class CheckConnectivity extends ConnectivityEvent {}

class ConnectedEvent extends ConnectivityEvent {}

class NotConnectedEvent extends ConnectivityEvent {}
