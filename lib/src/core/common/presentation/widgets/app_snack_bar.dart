import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:articles/src/core/core.dart';

enum ToastType { info, success, error }

class AppSnackBar {
  static void show(BuildContext context, String text, ToastType type) {
    Color backgroundColor;
    switch (type) {
      case ToastType.success:
        backgroundColor = AppColors.greenColor;
        break;
      case ToastType.error:
        backgroundColor = AppColors.redColor;
        break;
      default:
        backgroundColor = AppColors.darkGray;
    }

    Flushbar(
      duration: const Duration(seconds: 4),
      messageText: Text(
        text,
        style: AppTextStyle.regular(sizeText: SizeText.size14).copyWith(color: Colors.white, fontSize: SizeConfig.h(13)),
      ),
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.circular(15),
      icon: type == ToastType.success
          ? SvgPicture.asset(
              Helper.getSvgImage("check.svg"),
              height: SizeConfig.h(15),
              width: SizeConfig.h(15),
            )
          : SvgPicture.asset(
              Helper.getSvgImage("alert.svg"),
              height: SizeConfig.h(15),
              width: SizeConfig.h(15),
            ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.h(15), vertical: SizeConfig.h(15)),
    ).show(context);
    // scaffoldKey.currentState.showSnackBar(SnackBar(
    //     backgroundColor: backgroundColor,
    //     content: Text(
    //       text,
    //       style: TextStyle(color: Colors.white),
    //     )));
  }

  static void showWithUndo(String text, ToastType type, Function undoCallback, Function deleteCallback, BuildContext context) {
    Color backgroundColor = const Color(0xFFF05454);
    late Flushbar flush;
    flush = Flushbar(
      duration: const Duration(seconds: 4),
      messageText: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: SizeConfig.h(12)),
      ),
      backgroundColor: backgroundColor,
      flushbarPosition: FlushbarPosition.BOTTOM,
      onStatusChanged: (status) {
        if (FlushbarStatus.DISMISSED == status) {}
      },
      mainButton: TextButton(
        child: Text(
          "Back",
          style: AppTextStyle.regular(sizeText: SizeText.size16),
        ),
        onPressed: () {
          flush.dismiss();
          undoCallback();
        },
      ),
    );
    flush.show(context).then((value) {
      if (!flush.isDismissed()) {
        deleteCallback();
      }
    });
  }
}
