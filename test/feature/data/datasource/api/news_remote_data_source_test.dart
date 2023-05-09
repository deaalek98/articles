import 'dart:convert';

import 'package:articles/src/core/app_constants.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/features/articles_main/articles_main/data/data_sources/articles_main_api.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/usecases/articles_data_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../../data_mock/data_articles.dart';

void main() async {
  // late Dio dio;

  late DioAdapter dioAdapter;
  late ArticlesMainApi articlesMainApi;
  late Map data;
  sl.registerSingletonAsync<Dio>(() async {
    Dio dio = Dio(BaseOptions(baseUrl: ApiUrl));
    dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    return dio;
  });
  await sl.isReady<Dio>();

  group('Articles', () {
    setUp(() async {
      articlesMainApi = ArticlesMainApi();
      data = dataResponseArticles;
    });
    test('GetArticlesData Success', () async {
      const route = "all-sections/7.json?api-key=$API_KEY";
      dioAdapter.onGet(
        route,
        (server) => server.reply(
          200,
          data,
          delay: const Duration(seconds: 1),
        ),
        data: data,
      );
      // Returns a response with 201 Created success status response code.
      final response =
          await articlesMainApi.getArticlesData(params: ArticlesDataParams(7));
      var responseData = null;
      response.fold((l) => responseData = null, (r) => responseData = r);
      expect(responseData, listResponseTest);
    });

    test('GetArticlesData Error', () async {
      const route = "all-sections/7.json?api-key=$API_KEY";
      dioAdapter.onGet(
        route,
        (server) => server.reply(
          401,
          "Unauthorized",
          delay: const Duration(seconds: 1),
        ),
        data: data,
      );
      // Returns a response with 201 Created success status response code.
      final response =
          await articlesMainApi.getArticlesData(params: ArticlesDataParams(7));
      var responseData = null;
      response.fold((l) => responseData = l, (r) => responseData = r);
      expect(responseData.toString(),
          ServerFailure("Unauthorized", statusCode: 401).toString());
    });
  });
}
