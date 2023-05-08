import 'package:dartz/dartz.dart';
import 'package:articles/src/core/core.dart';

import '../repositories/intro_repository.dart';

class GetIntroInfoUseCase extends UseCase<IntroAction, NoParams> {
  final IntroRepository repository;

  GetIntroInfoUseCase(this.repository);

  @override
  Future<Either<Failure, IntroAction>> call(NoParams params) async {
    return Right(IntroAction(type: TypeUpdateVersion.acceptable, autoUpdate: true));
  }

  int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }
}

class IntroAction {
  final TypeUpdateVersion type;
  final bool autoUpdate;

  IntroAction({required this.type, required this.autoUpdate});
}

enum TypeUpdateVersion { acceptable, updateAvailable, updateMendatory }
