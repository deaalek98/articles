import 'package:articles/src/core/common/presentation/widgets/article_card_widget.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  final List<ArticleModel> listArticle;

  const SearchPage({Key? key, required this.listArticle}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchBloc _bloc = SearchBloc();
  List<ArticleModel> viewList = [];

  @override
  void initState() {
    viewList.addAll(widget.listArticle);
    // _bloc.add(SearchDataEvent(searchText:searchText, listArticle: widget.listArticle));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text("Search"),
      ),
      body: SafeArea(
          minimum: EdgeInsets.only(left: SizeConfig.w(10), right: SizeConfig.w(10)),
          bottom: false,
          child: BlocConsumer<SearchBloc, SearchState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is SearchSuccessState) {
                viewList.clear();
                viewList.addAll(state.listAResult);
              }
            },
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Column(
                  children: [
                    TextField(
                      cursorHeight: 25,
                      onChanged: (value) {
                        _bloc.add(SearchDataEvent(searchText: value, listArticle: widget.listArticle));
                        // Method For Searching
                      },
                      decoration: InputDecoration(
                        hintText: "Search Data",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(17.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.h(10),
                    ),
                    Expanded(
                      child:

                      viewList.length == 0 ? ReloadWidget.empty(  content: "No Records" ) :ListView.builder(
                        itemCount: viewList.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              ArticleCardWidget(
                                articleModel: viewList[i],
                              ),
                              if (i != (viewList.length - 1)) ...{
                                Divider(
                                  thickness: 0.4,
                                )
                              }
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
