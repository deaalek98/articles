import 'package:dartz/dartz.dart';
import '../repositories/main_repository.dart';
import '../../../../core/core.dart';

class MainDataUseCase extends UseCase<bool, MainParams> {
  final MainRepository repository;

  MainDataUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(MainParams params) async {
    return await repository.getArticles();
  }
}

class MainParams {
  MainParams();
}
