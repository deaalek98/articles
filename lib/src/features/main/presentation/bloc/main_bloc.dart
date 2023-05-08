import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/injections.dart';
import '../../../../features/main/domain/usecases/main_data_usecase.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  late MainDataUseCase mainUseCase;

  MainBloc() : super(MainInitial()) {
    mainUseCase = sl<MainDataUseCase>();
    on<MainDataEvent>(_getMainDataEvent);
  }

  _getMainDataEvent(MainDataEvent event, Emitter<MainState> emitter) async {
    emitter(MainLoadingState());
    final allActiveBalancesResponse = await mainUseCase.call(MainParams());
    allActiveBalancesResponse.fold((l) {
      emitter(MainFailureState(l.errorMessage));
    }, (r) async {
      emitter(MainSuccessState());
    });
  }
}
