import 'package:articles/src/core/core.dart';
import 'data/data_sources/details_api.dart';
import 'data/repositories/details_repo_empl.dart';
import 'domain/repositories/details_repository.dart';
import 'domain/usecases/details_data_usecase.dart';

initDetailsInjections() {
  sl.registerLazySingleton < DetailsApi > (() => DetailsApi());
  sl.registerLazySingleton<DetailsRepository>(() => DetailsRepositoryImpl(sl()));
  sl.registerFactory<DetailsDataUseCase>(() => DetailsDataUseCase(sl()));
}
