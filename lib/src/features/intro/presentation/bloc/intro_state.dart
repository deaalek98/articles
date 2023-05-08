part of 'intro_bloc.dart';

@immutable
abstract class IntroState {}

class IntroInitial extends IntroState {}

class LoadingGetPublicInfoState extends IntroState {}

class ErrorGetPublicInfoState extends IntroState {
  final String errorMessage;

  ErrorGetPublicInfoState(this.errorMessage);
}

class SuccessGetPublicInfoState extends IntroState {}
