import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:articles/src/core/core.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<UpdateModeEvent>((event, emit) async {
      if (event.isDarkMode) {
        await sl<AppSharedPrefs>().setTheme(true);
        emit(DarkModeSate());
      } else {
        await sl<AppSharedPrefs>().setTheme(false);
        emit(LightModeSate());
      }
    });

    on<UpdateLanguageEvent>((event, emit) async {
      await sl<AppSharedPrefs>().setLang(event.language);
      emit(LanguageUpdateState(event.language));
    });
  }
}
