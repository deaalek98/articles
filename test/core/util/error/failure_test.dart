import 'package:articles/src/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tErrorMessage = 'testErrorMessage';

  group('ServerFailure', () {
    test(
      'make sure the props value is [errorMessage]',
      () async {
        // assert
        expect(ServerFailure(tErrorMessage).props, [tErrorMessage]);
      },
    );

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(ServerFailure(tErrorMessage).toString(), 'ServerFailure{errorMessage: $tErrorMessage}');
      },
    );
  });

  group('CacheFailure', () {
    test(
      'make sure the props value is [errorMessage]',
      () async {
        // arrange
        expect(CacheFailure(tErrorMessage).props, [tErrorMessage]);
      },
    );

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(CacheFailure(tErrorMessage).toString(), 'CacheFailure{errorMessage: $tErrorMessage}');
      },
    );
  });

}
