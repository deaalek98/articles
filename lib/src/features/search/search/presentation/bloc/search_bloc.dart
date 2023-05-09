import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:articles/src/core/core.dart';
import '../../domain/usecases/search_data_usecase.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchDataEvent, SearchState> {
  late SearchDataUseCase searchUseCase;

  SearchBloc() : super(SearchInitial()) {
    searchUseCase = sl<SearchDataUseCase>();
    on<SearchDataEvent>(_getSearchDataEvent);
  }

  _getSearchDataEvent(SearchDataEvent event, Emitter<SearchState> emitter) async {
    emitter(SearchLoadingState());
    final response = await searchUseCase.call(SearchParams(listArticle: event.listArticle, searchText: event.searchText));
    response.fold((l) {
      emitter(SearchFailureState(l.errorMessage));
    }, (r) async {
      emitter(SearchSuccessState(r));
    });
  }
}
