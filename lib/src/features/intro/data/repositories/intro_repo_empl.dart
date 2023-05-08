import 'package:dartz/dartz.dart';
import 'package:articles/src/features/intro/domain/entities/intro.dart';
import '../../domain/repositories/intro_repository.dart';
import '../data_sources/intro_api.dart';
import 'package:articles/src/core/core.dart';

class IntroRepositoryImpl extends IntroRepository {
  final IntroApi introApi;

  IntroRepositoryImpl(this.introApi);

  @override
  Future<Either<Failure, IntroEntity>> getIntroInfo() async {
    try {
      final result = await introApi.getIntroInfo();
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
