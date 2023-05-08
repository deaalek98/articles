import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/repositories/main_repository.dart';
import '../data_sources/main_api.dart';

class MainRepositoryImpl extends MainRepository {
  final MainApi mainApi;

  MainRepositoryImpl(this.mainApi);

  @override
  Future<Either<Failure, bool>> getArticles() async {
    try {
      final result = await mainApi.getArticles();
      return result.fold((l) {
        return Left(ServerFailure(l.errorMessage, null));
      }, (r) {
        return Right(r);
      });
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
