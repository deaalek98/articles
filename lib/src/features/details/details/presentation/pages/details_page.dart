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

            expandedHeight: MediaQuery.of(context).size.height * 0.43,
            elevation: 0,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor,),
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: ImageNetworkWidget(
                    width: double.infinity,
                    height: SizeConfig.h(280),
                    url: ((widget.articleModel.media?.length ?? 0) > 0) &&
                            ((widget.articleModel.media?[widget.articleModel.media!.length - 1].metadataList?.length ?? 0) > 0)
                        ? (widget.articleModel.media?[widget.articleModel.media!.length - 1]
                                .metadataList?[widget.articleModel.media![widget.articleModel.media!.length - 1].metadataList!.length - 1].url ??
                            "")
                        : "")),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              decoration: BoxDecoration(
                // color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 8,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: widget.articleModel.adxKeywords
                              ?.split(";")
                              .map(
                                (e) => Container(
                              margin: EdgeInsets.only(left: 2),
                              child: FilterChip(
                                // backgroundColor: AppColors.lightGrey,
                                onSelected: (val) {},
                                backgroundColor: Colors.black.withOpacity(0.6),
                                labelPadding: EdgeInsets.only(left: 3, right: 3),
                                padding: EdgeInsets.all(2),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                shape: StadiumBorder(side: BorderSide()),
                                side: BorderSide(color: Colors.transparent),
                                label: Text(
                                  e,
                                  style: AppTextStyle.regular(sizeText: SizeText.size10).copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                              .toList() ??
                              []),
                    ),

                    ListTile(
                      horizontalTitleGap: 0,
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      trailing: Text(
                        HelperUtil.instance.getSections(widget.articleModel.updated ?? ""),
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
                      style: AppTextStyle.smiBold(sizeText: SizeText.size17),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      widget.articleModel.abstract ?? "",
                      style: AppTextStyle.regular(sizeText: SizeText.size14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
