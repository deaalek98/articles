import 'package:articles/src/core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// class MockDataConnectionChecker extends Mock implements handleDioError {}

void main() {
  // MockDataConnectionChecker mockDataConnectionChecker;

  // setUp(() {
  //   mockDataConnectionChecker = MockDataConnectionChecker();
  // });

  group('handleDioError400', () {
    test(
      'Test handleDioError when server',
      () async {
        List<int> errorCode = [400, 401, 403, 404];
        for (int i = 0; i < errorCode.length; i++) {
          expect(
              handleDioError(DioError(
                  requestOptions: RequestOptions(),
                  type: DioErrorType.badResponse,
                  response: Response(statusCode: errorCode[i], data: "Error MSG", requestOptions: RequestOptions()))),
              "Error MSG");
        }
      },
    );

    test(
      'Test handleDioError when server get 409',
      () async {
        expect(
            handleDioError(DioError(
                requestOptions: RequestOptions(),
                type: DioErrorType.badResponse,
                response: Response(
                    statusCode: 409,
                    data: {
                      "message": "ERROR_MSG",
                      "body": {"mins_to_join": "ERROR_MINS"}
                    },
                    requestOptions: RequestOptions()))),
            "ERROR_MSG" + ",\n Minutes left to join: " + "ERROR_MINS");
      },
    );
  });
}
