import 'package:articles/main.dart';
import 'package:articles/src/core/common/data/data_sources/app_shared_prefs.dart';
import 'package:articles/src/core/common/presentation/bloc/settings_bloc.dart';
import 'package:articles/src/core/common/presentation/widgets/image_network_widget.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/core/util/data_helper.dart';
import 'package:articles/src/core/util/helper_ui.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/features/articles_main/articles_main/presentation/widgets/article_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/articles_main_bloc.dart';

class ArticlesMainPage extends StatefulWidget {
  const ArticlesMainPage({Key? key}) : super(key: key);

  @override
  State<ArticlesMainPage> createState() => _ArticlesMainPageState();
}

class _ArticlesMainPageState extends State<ArticlesMainPage>
    with SingleTickerProviderStateMixin {
  final ArticlesMainBloc _bloc = ArticlesMainBloc();
  late TabController tabController;

  // List<String> sections = DataHelper.instance.getSections();
  List<ArticleModel> listArticles = [];
  List<ArticleModel> listSlider = [];
  final CarouselController _controller = CarouselController();
  int _current = 0;
  var scrollController = ScrollController();

  @override
  void initState() {
    _bloc.add(ArticlesMainDataEvent());
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
                // Provider.of<ThemeProvider>(context, listen: false)
                //     .changeTheme();

                BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!).add(
                    UpdateModeEvent(
                        isDarkMode: !sl<AppSharedPrefs>().getIsDarkTheme()));
                setState(() {});
              },
              icon: Icon(
                Icons.light_mode
                // (Provider.of<ThemeProvider>(context).isDark)
                //     ? Icons.light_mode
                //     : Icons.dark_mode,
                ,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: SafeArea(
        minimum:
            EdgeInsets.only(left: SizeConfig.w(10), right: SizeConfig.w(10)),
        bottom: false,
        child: BlocConsumer<ArticlesMainBloc, ArticlesMainState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is ArticlesMainSuccessState) {
              listArticles.clear();
              listArticles.addAll(state.listArticles);
              listSlider.clear();
              listSlider.addAll(state.slider);
            }
          },
          builder: (context, state) {
            return NestedScrollView(
                controller: scrollController,
                physics: ScrollPhysics(parent: PageScrollPhysics()),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([_buildSliderWidget()]),
                    ),
                  ];
                },
                body: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
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

    // return SafeArea(
    //   bottom: false,
    //   child: Scaffold(
    //     body: const Center(child: Text("Page")),
    //     appBar: AppBar(
    //       title: const Text("Test App"),
    //       actions: [
    //         InkWell(
    //             onTap: () {
    //               BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!)
    //                   .add(UpdateLanguageEvent(language: sl<AppSharedPrefs>().getLang() == "en" ? "ar" : "en"));
    //               setState(() {});
    //             },
    //             child: Container(
    //                 padding: const EdgeInsets.all(14),
    //                 child: Center(child: Text(sl<AppSharedPrefs>().getLang() == "en" ? S.of(context).ar : S.of(context).en))))
    //       ],
    //       leading: IconButton(
    //           onPressed: () {
    //             BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!).add(UpdateModeEvent(isDarkMode: !sl<AppSharedPrefs>().getIsDarkTheme()));
    //             setState(() {});
    //           },
    //           icon: Icon(sl<AppSharedPrefs>().getIsDarkTheme() ? Icons.lightbulb_outline : Icons.lightbulb)),
    //     ),
    //   ),
    // );
  }

  _buildSliderWidget() {
    return CarouselSlider(
      items: listSlider
          .map((e) => Container(
                padding: EdgeInsets.all(4),
                height: SizeConfig.h(240),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ImageNetworkWidget(
                        width: double.infinity,
                        height: SizeConfig.h(280),
                        url: ((e.media?.length ?? 0) > 0) &&
                                ((e.media?[e.media!.length - 1].metadataList
                                            ?.length ??
                                        0) >
                                    0)
                            ? (e
                                    .media?[e.media!.length - 1]
                                    .metadataList?[e.media![e.media!.length - 1]
                                            .metadataList!.length -
                                        1]
                                    .url ??
                                "")
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
                            style:
                                TextStyle(fontSize: 17, color: AppColors.white),
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
}
