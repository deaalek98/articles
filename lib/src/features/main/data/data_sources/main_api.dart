import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/core.dart';

class MainApi {
  Future<Either<Failure, bool>> getArticles() async {
    try {
      final result = (await sl<Dio>().get(
        "emailed/7.json?api-key=$API_KEY",
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
