// import 'package:articles/src/core/util/data_helper.dart';
// import 'package:articles/src/features/main/presentation/widgets/article_card_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../main.dart';
// import '../../../../features/main/presentation/bloc/main_bloc.dart';
// import 'package:articles/src/core/core.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage>
//     with SingleTickerProviderStateMixin {
//   final MainBloc _bloc = MainBloc();
//   late TabController tabController;
//   List<String> sections = DataHelper.instance.getSections();
//
//   @override
//   void initState() {
//     _bloc.add(MainDataEvent());
//     tabController = TabController(length: sections.length, vsync: this);
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // centerTitle: true,
//         title: Text("News"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Provider.of<ThemeProvider>(context, listen: false)
//               //     .changeTheme();
//
//               BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!).add(
//                   UpdateModeEvent(
//                       isDarkMode: !sl<AppSharedPrefs>().getIsDarkTheme()));
//               setState(() {});
//             },
//             icon: Icon(Icons.light_mode
//                 // (Provider.of<ThemeProvider>(context).isDark)
//                 //     ? Icons.light_mode
//                 //     : Icons.dark_mode,
//                 ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           TabBar(
//             isScrollable: true,
//             controller: tabController,
//             tabs: sections
//                 .map(
//                   (section) => Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                     child: Text(
//                       section,
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: tabController,
//               children: sections
//                   .map(
//                     (section) => Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 5, vertical: 20),
//                       child: ListView.builder(
//                         itemCount: ["newsList","ss","sasd"].length,
//                         itemBuilder: (context, i) {
//                           return ArticleCardWidget();
//                         },
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//
//     // return SafeArea(
//     //   bottom: false,
//     //   child: Scaffold(
//     //     body: const Center(child: Text("Page")),
//     //     appBar: AppBar(
//     //       title: const Text("Test App"),
//     //       actions: [
//     //         InkWell(
//     //             onTap: () {
//     //               BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!)
//     //                   .add(UpdateLanguageEvent(language: sl<AppSharedPrefs>().getLang() == "en" ? "ar" : "en"));
//     //               setState(() {});
//     //             },
//     //             child: Container(
//     //                 padding: const EdgeInsets.all(14),
//     //                 child: Center(child: Text(sl<AppSharedPrefs>().getLang() == "en" ? S.of(context).ar : S.of(context).en))))
//     //       ],
//     //       leading: IconButton(
//     //           onPressed: () {
//     //             BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!).add(UpdateModeEvent(isDarkMode: !sl<AppSharedPrefs>().getIsDarkTheme()));
//     //             setState(() {});
//     //           },
//     //           icon: Icon(sl<AppSharedPrefs>().getIsDarkTheme() ? Icons.lightbulb_outline : Icons.lightbulb)),
//     //     ),
//     //   ),
//     // );
//   }
// }
