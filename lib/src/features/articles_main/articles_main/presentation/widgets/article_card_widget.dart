import 'package:articles/src/core/core.dart';
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: ((articleModel.media?.length ?? 0) > 0) &&
                        ((articleModel.media?[0].metadataList?.length ?? 0) > 0)
                    ? (articleModel.media?[0].metadataList?[0].url ?? "")
                    : "",
                fit: BoxFit.cover,
                width: SizeConfig.w(100),
                height: SizeConfig.w(100),
                errorWidget: (context, url, error) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/img_not_found.jpg',
                      fit: BoxFit.cover,
                      width: SizeConfig.w(100),
                      height: SizeConfig.w(100),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/img_placeholder.jpg',
                      fit: BoxFit.cover,
                      width: SizeConfig.w(100),
                      height: SizeConfig.w(100),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: SizeConfig.w(14),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articleModel.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    articleModel.section ?? "",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "strPublishedAt",
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
                        "itemArticle name",
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
