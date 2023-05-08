import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/features/intro/domain/usecases/get_intro_info.dart';

part 'intro_event.dart';

part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  late GetIntroInfoUseCase _getIntroInfoUseCase;

  bool isAutoUpdate = false;

  IntroBloc() : super(IntroInitial()) {
    _getIntroInfoUseCase = sl<GetIntroInfoUseCase>();
    on<OnGettingPublicInfoEvent>(_onGettingPublicInfo);
  }

  _onGettingPublicInfo(OnGettingPublicInfoEvent event, Emitter<IntroState> emitter) async {
    try {
      final publicInfo = _getIntroInfoUseCase.call(NoParams());

      List<dynamic> resData = await Future.wait([
        publicInfo,
      ]);

      resData[0].fold((l) {
        emitter(ErrorGetPublicInfoState(l.errorMessage));
      }, (r) {
        emitter(SuccessGetPublicInfoState());
      });
    } catch (e) {
      emitter(ErrorGetPublicInfoState(e.toString()));
    }
  }
}
