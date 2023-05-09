import 'dart:convert';

import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../data_mock/data_articles.dart';

void main() {
  final articleModel = articleModelTest;

  test(
    'make sure the output of the toString function',
    () async {
      // assert
      expect(
        articleModel.toString(),
        'ArticleModel{id: ${articleModel.id}, title: ${articleModel.title}}',
      );
    },
  );

  group('fromJson', () {
    test(
      'make sure the fromJson function returns a valid model object when reading valid JSON',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = articleMap;

        // act
        final result = ArticleModel.fromJson(jsonMap);

        // assert
        expect(result, articleModel);
      },
    );
  });

}
