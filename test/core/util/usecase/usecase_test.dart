import 'package:articles/src/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'make sure that the props of NoParams is []',
    () async {
      // assert
      expect(NoParams().props, []);
    },
  );
}
