import 'package:articles/main.dart';
import 'package:articles/src/core/common/data/data_sources/app_shared_prefs.dart';
import 'package:articles/src/core/common/presentation/bloc/settings_bloc.dart';
import 'package:articles/src/core/common/presentation/widgets/image_network_widget.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/core/util/helper_ui.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/core/common/presentation/widgets/article_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/articles_main_bloc.dart';
import 'package:shimmer/shimmer.dart';

class LoadingArticlesPage extends StatefulWidget {
  const LoadingArticlesPage({Key? key}) : super(key: key);

  @override
  State<LoadingArticlesPage> createState() => _LoadingArticlesPageState();
}

class _LoadingArticlesPageState extends State<LoadingArticlesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.6),
                highlightColor: Colors.grey.withOpacity(0.4),
                enabled: true,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: SizeConfig.h(190),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.h(20),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: SizeConfig.w(70),
                                height: SizeConfig.w(70),
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(

                                      width: double.infinity,
                                      height: SizeConfig.h(14),
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: SizeConfig.h(8),
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: SizeConfig.w(40),

                                      height: SizeConfig.h(8),
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        itemCount: 7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
