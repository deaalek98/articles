import 'package:articles/main.dart';
import 'package:articles/src/core/common/data/data_sources/app_shared_prefs.dart';
import 'package:articles/src/core/common/presentation/bloc/settings_bloc.dart';
import 'package:articles/src/core/common/presentation/widgets/image_network_widget.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/core/util/helper_ui.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/core/common/presentation/widgets/article_card_widget.dart';
import 'package:articles/src/features/articles_main/articles_main/presentation/widgets/loading_articles_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/articles_main_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesMainPage extends StatefulWidget {
  const ArticlesMainPage({Key? key}) : super(key: key);

  @override
  State<ArticlesMainPage> createState() => _ArticlesMainPageState();
}

class _ArticlesMainPageState extends State<ArticlesMainPage> {
  final ArticlesMainBloc _bloc = ArticlesMainBloc();
  late TabController tabController;

  // List<String> sections = DataHelper.instance.getSections();
  List<ArticleModel> listAll = [];
  List<ArticleModel> listArticles = [];
  List<ArticleModel> listSlider = [];
  final CarouselController _controller = CarouselController();
  int _current = 0;
  var scrollController = ScrollController();
  int selectItemFilter = sl<AppSharedPrefs>().getFilter();

  @override
  void initState() {
    _bloc.add(ArticlesMainDataEvent(sl<AppSharedPrefs>().getFilter()));
    // tabController = TabController(length: sections.length, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text("News"),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!).add(UpdateModeEvent(isDarkMode: !sl<AppSharedPrefs>().getIsDarkTheme()));
                setState(() {});
              },
              icon: Icon(
                Icons.light_mode
                ,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        actions: [
          if (listAll.length > 0)
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/search_page", arguments: listAll);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              selectItemFilter = sl<AppSharedPrefs>().getFilter();
              late Function(void Function()) showUpperSheetState;
              HelperUi.showUpperSheetModal(context, StatefulBuilder(builder: (context, setState1) {
                showUpperSheetState = setState1;
                return _buildFilter(setState1);
              }), confirm: () {
                sl<AppSharedPrefs>().setFilter(selectItemFilter);
                _bloc.add(ArticlesMainDataEvent(sl<AppSharedPrefs>().getFilter()));
              }, reset: () {
                selectItemFilter = Helper.getListFilter()[0];
                showUpperSheetState(() {});
              });
            },
            icon: Icon(
              Icons.filter_list,
            ),
          ),
        ],
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(left: SizeConfig.w(10), right: SizeConfig.w(10)),
        bottom: false,
        child: BlocConsumer<ArticlesMainBloc, ArticlesMainState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is ArticlesMainSuccessState) {
              listArticles.clear();
              listArticles.addAll(state.listArticles);
              listSlider.clear();
              listSlider.addAll(state.slider);
              listAll.clear();
              listAll.addAll(state.all);
            }
          },
          builder: (context, state) {
            if (state is ArticlesMainLoadingState) {
              return LoadingArticlesPage();
            } else if (state is ArticlesMainFailureState) {
              return Center(
                child: ReloadWidget.error(
                    content: state.message,
                    onPressed: () {
                      _bloc.add(ArticlesMainDataEvent(sl<AppSharedPrefs>().getFilter()));
                    }),
              );
            } else if (listArticles.length == 0) {
              return Center(
                child: ReloadWidget.empty(
                    content: "No Records",
                    onPressed: () {
                      _bloc.add(ArticlesMainDataEvent(sl<AppSharedPrefs>().getFilter()));
                    }),
              );
            }
            return NestedScrollView(
                controller: scrollController,
                physics: ScrollPhysics(parent: PageScrollPhysics()),
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    if (listSlider.length > 0)
                      SliverList(
                        delegate: SliverChildListDelegate([_buildSliderWidget()]),
                      ),
                  ];
                },
                body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: ListView.builder(
                    itemCount: listArticles.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          ArticleCardWidget(
                            articleModel: listArticles[i],
                          ),
                          if (i != (listArticles.length - 1)) ...{
                            Divider(
                              thickness: 0.4,
                            )
                          }
                        ],
                      );
                    },
                  ),
                ));
          },
        ),
      ),
    );

  }

  _buildSliderWidget() {
    return CarouselSlider(
      items: listSlider
          .map((e) => Container(
                padding: EdgeInsets.all(4),
                height: SizeConfig.h(240),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/details_page", arguments: e);
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ImageNetworkWidget(
                          width: double.infinity,
                          height: SizeConfig.h(280),
                          url: ((e.media?.length ?? 0) > 0) && ((e.media?[e.media!.length - 1].metadataList?.length ?? 0) > 0)
                              ? (e.media?[e.media!.length - 1].metadataList?[e.media![e.media!.length - 1].metadataList!.length - 1].url ?? "")
                              : ""),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.0),
                            ],
                            stops: [
                              0.0,
                              1.0,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 23,
                                vertical: 8,
                              ),
                              child: Text(
                                'Latest News',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // Spacer(),
                            SizedBox(
                              height: SizeConfig.h(4),
                            ),
                            Text(
                              e.title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 17, color: AppColors.white),
                            ),
                            Text(
                              HelperUtil.instance.getSections(e.updated ?? ""),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
      carouselController: _controller,
      options: CarouselOptions(
          autoPlay: true,
          // enlargeCenterPage: true,
          viewportFraction: 1.0,
          height: SizeConfig.h(240),
          enlargeCenterPage: false,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
    );
  }

  _buildFilter(Function(void Function()) showUpperSheetState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "News for ",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: SizeConfig.h(10),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            for (int i = 0; i < Helper.getListFilter().length; i++) ...{
              InkWell(
                onTap: () {
                  selectItemFilter = Helper.getListFilter()[i];
                  showUpperSheetState(() {});
                },
                child: Container(
                  height: SizeConfig.h(100),
                  width: SizeConfig.w(100),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color:
                          selectItemFilter == Helper.getListFilter()[i] ? AppColors.white.withOpacity(0.05) : AppColors.lightGrey.withOpacity(0.05),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      border: Border.all(
                          width: 1.5,
                          color:
                              selectItemFilter == Helper.getListFilter()[i] ? Theme.of(context).primaryColor : AppColors.lightGrey.withOpacity(0.4))),
                  child: Center(
                      child: Text(
                    Helper.getListFilter()[i] <= 1 ? "${Helper.getListFilter()[i]} Day" : "${Helper.getListFilter()[i]} Days",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.smiBold(
                      sizeText: SizeText.size18,
                    ).copyWith(
                      color: selectItemFilter == Helper.getListFilter()[i] ? Theme.of(context).primaryColor.withOpacity(0.7) : AppColors.lightGrey,
                    ),
                  )),
                ),
              ),
              Spacer(),
            },
          ],
        ),
        SizedBox(
          height: SizeConfig.h(20),
        ),
      ],
    );
  }
}
