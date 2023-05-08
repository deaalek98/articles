import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:articles/src/core/core.dart';
import '../../domain/usecases/details_data_usecase.dart';

part 'details_event.dart';

part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsDataEvent, DetailsState> {
  late DetailsDataUseCase detailsUseCase;

  DetailsBloc() : super(DetailsInitial()) {
detailsUseCase = sl<DetailsDataUseCase>();
    on<DetailsDataEvent>(_getDetailsDataEvent);
  }

_getDetailsDataEvent(DetailsDataEvent event, Emitter<DetailsState> emitter) async {
    emitter(DetailsLoadingState());
    final allActiveBalancesResponse = await detailsUseCase.call(DetailsParams(id: event.id));
    allActiveBalancesResponse.fold((l) {
      emitter(DetailsFailureState(l.errorMessage));
    }, (r) async {
      emitter(DetailsSuccessState());
    });
  }
}
