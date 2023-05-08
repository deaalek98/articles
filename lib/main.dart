import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/features/intro/presentation/pages/splash_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  tz.initializeTimeZones();
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class App extends StatefulWidget {
  static const String defaultLanguage = "en";

  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

final navigatorKey = GlobalKey<NavigatorState>();
final nestedNavigator = GlobalKey<NavigatorState>();

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // deviceLanguageCode = Platform.localeName.split('_')[0];
    // final lang = sl<AppSharedPrefs>().getLang();

    // initFirebaseMessaging();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    // authBloc.close();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final SettingsBloc settingsBloc = SettingsBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SettingsBloc>.value(
            value: settingsBloc,
          ),
        ],
        child: BlocConsumer(
          bloc: settingsBloc,
          listener: (context, state) async {},
          builder: (context, state) {
            bool isDark = sl<AppSharedPrefs>().getIsDarkTheme();
            if (isDark && !Platform.isIOS) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.black,
                statusBarBrightness: Brightness.light,
              ));
            } else {
              SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
            }

            Locale locale = Locale(sl<AppSharedPrefs>().getLang());
            return MaterialApp(
              title: 'MetaConnect',
              onGenerateRoute: AppRouter.generateRoute,
              theme: isDark ? darkAppTheme : lightAppTheme,
              debugShowCheckedModeBanner: false,
              locale: locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                MonthYearPickerLocalizations.delegate,
              ],
              navigatorKey: navigatorKey,
              supportedLocales: const [
                Locale("ar"),
                Locale("en"),
              ],
              builder: (con, child) {
                SizeConfig().init(con);
                return LoaderOverlay(
                  child: ConnectivityBuilder(
                      connectedCallback: () {},
                      noInternetString: "noInternet",
                      tryAgainString: "tryAgain",
                      child: Directionality(textDirection: locale.languageCode != "ar" ? TextDirection.ltr : TextDirection.rtl, child: child!)),
                );
              },
              // initialRoute: "/",
              home: const SplashPage(),
            );
          },
        ));
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print(event);
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(error);
    }
    super.onError(bloc, error, stackTrace);
  }
}
