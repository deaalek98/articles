import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../main.dart';
import '../../../../features/main/presentation/bloc/main_bloc.dart';
import 'package:articles/src/core/core.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc _bloc = MainBloc();

  @override
  void initState() {
    _bloc.add(MainDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: const Center(child: Text("Page")),
        appBar: AppBar(
          title: const Text("Test App"),
          actions: [
            InkWell(
                onTap: () {
                  BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!)
                      .add(UpdateLanguageEvent(language: sl<AppSharedPrefs>().getLang() == "en" ? "ar" : "en"));
                  setState(() {});
                },
                child: Container(
                    padding: const EdgeInsets.all(14),
                    child: Center(child: Text(sl<AppSharedPrefs>().getLang() == "en" ? S.of(context).ar : S.of(context).en))))
          ],
          leading: IconButton(
              onPressed: () {
                BlocProvider.of<SettingsBloc>(navigatorKey.currentContext!).add(UpdateModeEvent(isDarkMode: !sl<AppSharedPrefs>().getIsDarkTheme()));
                setState(() {});
              },
              icon: Icon(sl<AppSharedPrefs>().getIsDarkTheme() ? Icons.lightbulb_outline : Icons.lightbulb)),
        ),
      ),
    );
  }
}
