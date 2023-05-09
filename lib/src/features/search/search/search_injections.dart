import 'package:articles/src/core/core.dart';

import 'domain/usecases/search_data_usecase.dart';

initSearchInjections() {
  sl.registerFactory<SearchDataUseCase>(() => SearchDataUseCase());
}
