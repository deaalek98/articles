import 'package:articles/src/core/common/presentation/widgets/image_network_widget.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/core/util/helper_ui.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final ArticleModel articleModel;

  const DetailsPage({Key? key, required this.articleModel}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var scrollController = ScrollController();

  @override
  void initState() {
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
      body: CustomScrollView(
        primary: true,
        shrinkWrap: false,
        slivers: <Widget>[
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
            expandedHeight: MediaQuery.of(context).size.height * 0.43,
            elevation: 0,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: ImageNetworkWidget(
                    width: double.infinity,
                    height: SizeConfig.h(280),
                    url: ((widget.articleModel.media?.length ?? 0) > 0) &&
                            ((widget
                                        .articleModel
                                        .media?[
                                            widget.articleModel.media!.length -
                                                1]
                                        .metadataList
                                        ?.length ??
                                    0) >
                                0)
                        ? (widget
                                .articleModel
                                .media?[widget.articleModel.media!.length - 1]
                                .metadataList?[widget
                                        .articleModel
                                        .media![
                                            widget.articleModel.media!.length -
                                                1]
                                        .metadataList!
                                        .length -
                                    1]
                                .url ??
                            "")
                        : "")),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 8,
                  children: [
                    ListTile(
                      horizontalTitleGap: 0,
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      trailing: Text(
                        HelperUtil.instance
                            .getSections(widget.articleModel.updated ?? ""),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      leading: Icon(
                        Icons.article_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      widget.articleModel.title ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      widget.articleModel.abstract ?? "",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    Wrap(
                        children: widget.articleModel.adxKeywords
                                ?.split(";")
                                .map(
                                  (e) => Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: FilterChip(
                                      // backgroundColor: AppColors.lightGrey,
                                      onSelected: (val) {},
                                      backgroundColor: Colors.grey,
                                      padding: EdgeInsets.all(2),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      shape: StadiumBorder(side: BorderSide()),
                                      side:
                                          BorderSide(color: Colors.transparent),
                                      label: Text(
                                        e,
                                        style: AppTextStyle.regular(
                                                sizeText: SizeText.size12)
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                                .toList() ??
                            []),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: NestedScrollView(
          controller: scrollController,
          physics: ScrollPhysics(parent: PageScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  ImageNetworkWidget(
                      width: double.infinity,
                      height: SizeConfig.h(280),
                      url: ((widget.articleModel.media?.length ?? 0) > 0) &&
                              ((widget
                                          .articleModel
                                          .media?[widget
                                                  .articleModel.media!.length -
                                              1]
                                          .metadataList
                                          ?.length ??
                                      0) >
                                  0)
                          ? (widget
                                  .articleModel
                                  .media?[widget.articleModel.media!.length - 1]
                                  .metadataList?[widget
                                          .articleModel
                                          .media![widget
                                                  .articleModel.media!.length -
                                              1]
                                          .metadataList!
                                          .length -
                                      1]
                                  .url ??
                              "")
                          : "")
                ]),
              ),
            ];
          },
          body: Text("")),
    );
  }
}
