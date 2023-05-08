import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/core.dart';

class MainApi {
  Future<Either<Failure, bool>> getMainData() async {
    try {
      final result = (await sl<Dio>().get(
        "v3.1/all",
      ))
          .data;
      // Map<String, dynamic>? body = result["body"];
      // BalanceInfoModel.fromJson(body)
      return const Right(true);
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
