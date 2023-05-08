import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(String errorMessage, this.statusCode)
      : super(
          errorMessage,
        );
}

class CacheFailure extends Failure {
  const CacheFailure(String errorMessage) : super(errorMessage);
}

class FakeFailure extends Failure {
  const FakeFailure(String message) : super(message);
}
