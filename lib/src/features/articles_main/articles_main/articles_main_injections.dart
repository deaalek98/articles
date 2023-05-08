import 'package:articles/src/core/core.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/usecases/articles_data_usecase.dart';
import 'data/data_sources/articles_main_api.dart';
import 'data/repositories/articles_main_repo_empl.dart';
import 'domain/repositories/articles_main_repository.dart';

initArticlesMainInjections() {
  sl.registerLazySingleton<ArticlesMainApi>(() => ArticlesMainApi());
  sl.registerLazySingleton<ArticlesMainRepository>(
      () => ArticlesMainRepositoryImpl(sl()));
  sl.registerFactory<ArticlesDataUseCase>(() => ArticlesDataUseCase(sl()));
}
