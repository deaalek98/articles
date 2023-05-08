import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:articles/src/core/core.dart';

class DetailsApi {


  Future<Either<Failure, bool>> getDetailsData({required int id}) async {
    try {
      final result = (await sl<Dio>().get("v2/get",)).data;
      Map<String,dynamic>? body = result["body"];
      // BalanceInfoModel.fromJson(body)
        return  const Right(true);

    } on DioError catch (e) {
      throw ServerException(handleDioError(e),e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(),null);
    }
  }

}
