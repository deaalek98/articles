import 'package:articles/main.dart';
import 'package:articles/src/core/common/data/data_sources/app_shared_prefs.dart';
import 'package:articles/src/core/common/presentation/bloc/settings_bloc.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/core/util/data_helper.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/features/articles_main/articles_main/presentation/widgets/article_card_widget.dart';
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
  List<String> sections = DataHelper.instance.getSections();

  @override
  void initState() {
    _bloc.add(ArticlesMainDataEvent());
    tabController = TabController(length: sections.length, vsync: this);

    super.initState();
  }

  List<ArticleModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text("News"),
        actions: [
          IconButton(
            onPressed: () {
              // Provider.of<ThemeProvider>(context, listen: false)
              //     .changeTheme();

              BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!).add(
                  UpdateModeEvent(
                      isDarkMode: !sl<AppSharedPrefs>().getIsDarkTheme()));
              setState(() {});
            },
            icon: Icon(Icons.light_mode
                // (Provider.of<ThemeProvider>(context).isDark)
                //     ? Icons.light_mode
                //     : Icons.dark_mode,
                ),
          ),
        ],
      ),
      body: BlocConsumer<ArticlesMainBloc, ArticlesMainState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is ArticlesMainSuccessState) {
            list.clear();
            list.addAll(state.list);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // TabBar(
              //   isScrollable: true,
              //   controller: tabController,
              //   tabs: sections
              //       .map(
              //         (section) => Container(
              //           padding:
              //               const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              //           child: Text(
              //             section,
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: sections
                      .map(
                        (section) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 20),
                          child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  ArticleCardWidget(
                                    articleModel: list[i],
                                  ),
                                  if (i != (list.length - 1)) ...{
                                    Divider(thickness: 0.4,)
                                  }
                                ],
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        },
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
}
