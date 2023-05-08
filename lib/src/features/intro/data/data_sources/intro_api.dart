import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/features/intro/domain/entities/intro.dart';

class IntroApi {
  Future<Either<Failure, IntroEntity>> getIntroInfo() async {
    try {
      final result = (await sl<Dio>().get(
        "v3.1/all",
      ))
          .data;

      return Right(IntroEntity(acceptAndroid: "1.0.0", acceptIos: "1.0.0", autoUpdate: false, currentAndroid: "1.0.0", currentIos: "1.0.0"));
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
