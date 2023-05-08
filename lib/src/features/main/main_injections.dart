import '../../../../src/core/core.dart';
import '../../../../src/features/main/data/data_sources/main_api.dart';
import '../../../../src/features/main/data/repositories/main_repo_empl.dart';
import '../../../../src/features/main/domain/repositories/main_repository.dart';
import '../../../../src/features/main/domain/usecases/main_data_usecase.dart';

initMainInjections() {
  sl.registerLazySingleton<MainApi>(() => MainApi());
  sl.registerLazySingleton<MainRepository>(() => MainRepositoryImpl(
        sl(),
      ));
  sl.registerFactory<MainDataUseCase>(() => MainDataUseCase(sl()));
}
