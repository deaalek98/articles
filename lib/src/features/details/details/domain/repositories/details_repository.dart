import 'package:dartz/dartz.dart';

import 'package:articles/src/core/core.dart';

abstract class DetailsRepository {
  Future<Either<Failure, bool>> getDetailsData({required int id});
}
