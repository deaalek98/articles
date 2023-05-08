import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/usecases/articles_data_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:articles/src/core/core.dart';

part 'articles_main_event.dart';

part 'articles_main_state.dart';

class ArticlesMainBloc extends Bloc<ArticlesMainDataEvent, ArticlesMainState> {
  late ArticlesDataUseCase articlesUseCase;

  ArticlesMainBloc() : super(ArticlesMainInitial()) {
    articlesUseCase = sl<ArticlesDataUseCase>();
    on<ArticlesMainDataEvent>(_getArticlesMainDataEvent);
  }

  _getArticlesMainDataEvent(
      ArticlesMainDataEvent event, Emitter<ArticlesMainState> emitter) async {
    emitter(ArticlesMainLoadingState());
    final response = await articlesUseCase.call(ArticlesDataParams());
    response.fold((l) {
      emitter(ArticlesMainFailureState(l.errorMessage));
    }, (r) async {
      emitter(ArticlesMainSuccessState(r));
    });
  }
}
