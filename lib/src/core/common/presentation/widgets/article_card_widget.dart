import 'package:articles/src/core/common/presentation/widgets/image_network_widget.dart';
import 'package:articles/src/core/core.dart';
import 'package:articles/src/core/util/helper_ui.dart';
import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
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
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          Navigator.of(context).pushNamed("/details_page", arguments: articleModel);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageNetworkWidget(
                url: ((articleModel.media?.length ?? 0) > 0) && ((articleModel.media?[0].metadataList?.length ?? 0) > 0)
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
                    style: AppTextStyle.regular(sizeText: SizeText.size17),
                  ),
                  SizedBox(
                    height: SizeConfig.h(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        articleModel.section ?? "",
                        style: AppTextStyle.regular(sizeText: SizeText.size12).copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        ' | ',
                        style: AppTextStyle.regular(sizeText: SizeText.size12).copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        HelperUtil.instance.getSections(articleModel.updated ?? ""),
                        style: AppTextStyle.regular(sizeText: SizeText.size12).copyWith(
                          color: Colors.grey,
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
  }
}
