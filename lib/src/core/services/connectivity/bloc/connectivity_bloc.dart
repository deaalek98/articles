import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';

part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<CheckConnectivity>(_onCheckConnectivity);
    on<ConnectedEvent>((event, emit) => emit(Connected()));
    on<NotConnectedEvent>((event, emit) {
      if (state is! NotConnected) emit(NotConnected());
    });
  }

  _onCheckConnectivity(CheckConnectivity event, Emitter<ConnectivityState> emit) async {
    emit(ConnectivityInitial());
  }
}
