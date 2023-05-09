import 'package:flutter/material.dart';

class ArrowBackIconWidget extends StatelessWidget {
  final Color? iconColor;
  const ArrowBackIconWidget({Key? key, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios,
      color: iconColor ?? Theme.of(context).iconTheme.color,
      size: Theme.of(context).iconTheme.size ?? 23,
    );
  }
}
