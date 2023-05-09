// Mocks generated by Mockito 5.4.0 from annotations
// in articles/test/feature/domain/usecase/articles_data_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:articles/src/core/core.dart' as _i5;
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart'
    as _i6;
import 'package:articles/src/features/articles_main/articles_main/domain/repositories/articles_main_repository.dart'
    as _i3;
import 'package:articles/src/features/articles_main/articles_main/domain/usecases/articles_data_usecase.dart'
    as _i7;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ArticlesMainRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockArticlesMainRepository extends _i1.Mock
    implements _i3.ArticlesMainRepository {
  MockArticlesMainRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ArticleModel>>> getArticlesData(
          {required _i7.ArticlesDataParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getArticlesData,
          [],
          {#params: params},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.ArticleModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.ArticleModel>>(
          this,
          Invocation.method(
            #getArticlesData,
            [],
            {#params: params},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ArticleModel>>>);
}

/// A class which mocks [ArticlesMainRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCatRelaxed extends _i1.Mock implements _i3.ArticlesMainRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ArticleModel>>> getArticlesData(
          {required _i7.ArticlesDataParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getArticlesData,
          [],
          {#params: params},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.ArticleModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.ArticleModel>>(
          this,
          Invocation.method(
            #getArticlesData,
            [],
            {#params: params},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ArticleModel>>>);
}