import 'package:dio/dio.dart';

String handleDioError(DioError error) {
  String errorDescription = "";

  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioErrorType.connectionTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioErrorType.unknown:
      errorDescription = "Internet Connection Problem.";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioErrorType.badResponse:
      {
        if (error.response?.statusCode == 422) {
          errorDescription = (error.response?.data is Map && error.response?.data["body"] != null)
              ? error.response?.data["body"]["validations"].values.first[0] ?? error.response?.data["message"] ?? "Unknown Error"
              :error.response?.data ?? "Unknown Error" ;
        } else if (error.response?.statusCode == 400) {
          errorDescription = error.response?.data ?? "Unknown Error";
        } else if (error.response?.statusCode == 401) {
          errorDescription = error.response?.data ?? "Unauthorized";
        } else if (error.response?.statusCode == 403) {
          errorDescription = error.response?.data ?? "Unknown Error";
        } else if (error.response?.statusCode == 404) {
          errorDescription = error.response?.data ?? "Unknown Error";
        } else if (error.response?.statusCode == 409) {
          errorDescription =
              error.response?.data["message"] + ",\n Minutes left to join: " + error.response?.data["body"]["mins_to_join"].toString() ??
                  "Unknown Error";
        } else {
          errorDescription = "Received invalid status code: ${error.response?.statusCode}";
        }
        break;
      }

    case DioErrorType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
    case DioErrorType.badCertificate:
      errorDescription = "Internet Connection Problem.";
      break;
    case DioErrorType.connectionError:
      errorDescription = "Internet Connection Problem.";
      break;
  }

  return errorDescription;
}
