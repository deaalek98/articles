import 'package:articles/src/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double? radius;

  const ImageNetworkWidget(
      {Key? key, required this.url, this.width, this.height, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return SizedBox(
        width: width ?? SizeConfig.w(90),
        height: height ?? SizeConfig.w(90),
        child: Image.asset(
          'assets/images/img_not_found.jpg',
          fit: BoxFit.cover,
          height: SizeConfig.w(90),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 8),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: width ?? SizeConfig.w(90),
        height: height ?? SizeConfig.w(90),
        errorWidget: (context, url, error) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/img_not_found.jpg',
              fit: BoxFit.cover,
              height: SizeConfig.w(90),
            ),
          );
        },
        placeholder: (context, url) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/img_placeholder.jpg',
              fit: BoxFit.cover,
              height: SizeConfig.w(90),
            ),
          );
        },
      ),
    );
  }
}
