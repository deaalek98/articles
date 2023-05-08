part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class DarkModeSate extends SettingsState {}

class LightModeSate extends SettingsState {}

class LanguageUpdateState extends SettingsState {
  final String language;

  LanguageUpdateState(this.language);
}
