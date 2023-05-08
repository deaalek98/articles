import 'package:dartz/dartz.dart';
import '../repositories/details_repository.dart';
import 'package:articles/src/core/core.dart';
class DetailsDataUseCase extends UseCase<bool, DetailsParams> {
  final  DetailsRepository repository;
DetailsDataUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(DetailsParams params) async {
    return await repository.getDetailsData(id: params.id);
  }
}

class DetailsParams {
  int id ;
DetailsParams({required this.id});
}
