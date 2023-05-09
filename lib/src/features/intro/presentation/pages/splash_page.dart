import 'package:articles/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:articles/src/core/common/presentation/widgets/app_snack_bar.dart';
import 'package:articles/src/features/intro/presentation/bloc/intro_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final IntroBloc _introBloc = IntroBloc();

  @override
  void initState() {
    _introBloc.add(OnGettingPublicInfoEvent());
    super.initState();
  }

  @override
  void dispose() {
    _introBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
          bloc: _introBloc,
          listener: (context, state) {
            if (state is SuccessGetPublicInfoState) {
              process();

            } else if (state is ErrorGetPublicInfoState) {
              AppSnackBar.show(
                  context, "Internet connection error ", ToastType.error);
            }
          },
          builder: (context, state) {
            return Stack(
              children:   [
                Container(
                  color: AppColors.BackgroundColorLight,
                  child: Center(child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      "assets/images/app_logo.png",
                      fit: BoxFit.cover,
                      height: SizeConfig.h(200),
                    ),
                  )),
                ),
              ],
            );
          }),
    );
  }

  void process() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacementNamed(context, '/articles_page');
  }
}
