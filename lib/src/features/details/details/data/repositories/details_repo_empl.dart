import 'package:dartz/dartz.dart';

import 'package:articles/src/core/core.dart';
import '../../domain/repositories/details_repository.dart';
import '../data_sources/details_api.dart';

class DetailsRepositoryImpl extends DetailsRepository {
  final DetailsApi detailsApi;

DetailsRepositoryImpl(this.detailsApi);

  @override
  Future<Either<Failure, bool>> getDetailsData({required int id}) async {
    try {
      final result = await detailsApi.getDetailsData(id:id);
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
