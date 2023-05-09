import 'package:articles/src/core/common/presentation/widgets/arrow_back_icon.dart';
import 'package:articles/src/core/common/presentation/widgets/main_button.dart';
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


  static void showUpperSheetModal(BuildContext context, Widget child, {Function? reset, Function? confirm}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
                color: Theme.of(context).dialogBackgroundColor,
                child: Material(
                  color: AppColors.transparent,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.h(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const ArrowBackIconWidget(),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.filter_alt,
                              color: Theme.of(context).iconTheme.color,
                              size: SizeConfig.h(30),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.h(30),
                      ),
                      child,
                      Row(
                        children: [
                          Expanded(
                            child: MainButton(
                              label: "Rest",
                              onPressed: () {
                                if (reset != null) {
                                  reset();
                                }
                                // Navigator.pop(context);
                              },
                              hasBorder: true,
                              borderColor: AppColors.lightGrey,
                              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              // padding: EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.w(30),
                          ),
                          Expanded(
                            child: MainButton(
                              label: "Confirm",
                              // hasGradiantBorder: true,
                              onPressed: () {
                                if (confirm != null) {
                                  confirm();
                                }
                                Navigator.pop(context);
                              },
                              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              // padding: EdgeInsets.symmetric(vertical: SizeConfig.h(12)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.h(20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }

}
