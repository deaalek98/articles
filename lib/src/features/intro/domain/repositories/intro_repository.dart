import 'package:dartz/dartz.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/features/intro/domain/entities/intro.dart';

abstract class IntroRepository {
  Future<Either<Failure, IntroEntity>> getIntroInfo();
}
