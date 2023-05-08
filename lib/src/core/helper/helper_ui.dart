import 'package:flutter/material.dart';
import 'package:articles/src/core/core.dart';

class HelperUi {
  static showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => false, child: const AppLoader());
      },
    );
  }

  static showSnackBar(BuildContext context, String message, {ToastType type = ToastType.info}) {
    AppSnackBar.show(context, message, type);
  }
}
