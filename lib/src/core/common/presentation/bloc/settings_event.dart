part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class UpdateModeEvent extends SettingsEvent {
  final bool isDarkMode;

  UpdateModeEvent({required this.isDarkMode});
}

class UpdateLanguageEvent extends SettingsEvent {
  final String language;

  UpdateLanguageEvent({required this.language});
}
