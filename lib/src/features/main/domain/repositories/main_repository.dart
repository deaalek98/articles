import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract class MainRepository {
  Future<Either<Failure, bool>> getMainData();
}
