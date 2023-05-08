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
      r.sort((a, b) => b.updated?.compareTo(a.updated ?? "") ?? 0,);
      List<ArticleModel> listArticles = [];
      List<ArticleModel> slider = [];
      if (r.length >3){
        slider.addAll(r.getRange(0, 3));
        listArticles.addAll(r.getRange(3, r.length));
      }else{
        listArticles.addAll(r);
      }
      emitter(ArticlesMainSuccessState(listArticles: listArticles,slider: slider));
    });
  }
}
