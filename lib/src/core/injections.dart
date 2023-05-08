import 'package:articles/src/features/articles_main/articles_main/articles_main_injections.dart';
import 'package:articles/src/features/details/details/details_injections.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/features/intro/intro_injection.dart';
import 'package:articles/src/features/main/main_injections.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initCoreInjections();
  await initIntroInjections();
  await initMainInjections();
  await initArticlesMainInjections();
  await initDetailsInjections();
}

Future<void> initCoreInjections() async {
  initRootLogger();

  sl.registerSingletonAsync<Dio>(() async {
    final dio = Dio(BaseOptions(
        baseUrl: ApiUrl,
        validateStatus: (s) {
          return s! < 300;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "charset": "utf-8",
          "Accept-Charset": "utf-8",
        },
        responseType: ResponseType.json));

    dio.interceptors.add(LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    ));
    return dio;
  });
  await sl.isReady<Dio>();
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();

  sl.registerLazySingleton<AppSharedPrefs>(() => AppSharedPrefs(sl()));
}
