import 'package:articles/src/core/common/presentation/widgets/image_network_widget.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/core/util/helper_ui.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleCardWidget extends StatelessWidget {
  final ArticleModel articleModel;

  ArticleCardWidget({required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: SizeConfig.w(120),
      child: GestureDetector(
        onTap: () async {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageNetworkWidget(
                url: ((articleModel.media?.length ?? 0) > 0) &&
                        ((articleModel.media?[0].metadataList?.length ?? 0) > 0)
                    ? (articleModel.media?[0].metadataList?[0].url ?? "")
                    : ""),
            SizedBox(
              width: SizeConfig.w(14),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    articleModel.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.h(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        articleModel.section ?? "",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        HelperUtil.instance
                            .getSections(articleModel.updated ?? ""),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //
    // return Padding(
    //   padding: const EdgeInsets.all(10),
    //   child: InkWell(
    //     borderRadius: BorderRadius.circular(20),
    //     onTap: () {
    //       Navigator.of(context).pushNamed("details_page");
    //     },
    //     child: Container(
    //       height: MediaQuery.of(context).size.height * 0.3,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         color: Colors.grey.shade400,
    //         borderRadius: BorderRadius.circular(20),
    //         image: DecorationImage(
    //           fit: BoxFit.cover,
    //           image: NetworkImage(
    //               "https://puducherry-dt.gov.in/wp-content/themes/district-theme-2/images/blank.jpg"
    //             // (news.image == "null")
    //             //     ? "https://puducherry-dt.gov.in/wp-content/themes/district-theme-2/images/blank.jpg"
    //             //     : news.image,
    //           ),
    //         ),
    //       ),
    //       alignment: Alignment.bottomCenter,
    //       child: Container(
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           color: Colors.black.withOpacity(0.7),
    //           borderRadius: const BorderRadius.only(
    //             bottomLeft: Radius.circular(20),
    //             bottomRight: Radius.circular(20),
    //           ),
    //         ),
    //         padding: const EdgeInsets.all(15),
    //         child: Text(
    //           "deaa",
    //           // (news.title == "null") ? "" : news.title,
    //           style: Theme.of(context).textTheme.titleMedium?.merge(
    //             const TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
