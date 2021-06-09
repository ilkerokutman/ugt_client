import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';

class UgtDialogs {
  static showUgtDialog({
    required BuildContext context,
    String title = '',
    String desc = '',
    String negativeText = "İptal",
    String positiveText = "Tamam",
    GestureTapCallback? negativeAction,
    GestureTapCallback? positiveAction,
  }) {
    showDialog(
        context: context,
        barrierColor: Colors.black54,
        barrierDismissible: true,
        useSafeArea: true,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsOverflowButtonSpacing: 20,
            actionsOverflowDirection: VerticalDirection.up,
            actionsPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentTextStyle: TextStyle(color: Colors.black87),
            title: Text(title),
            content: Text(desc),
            actions: [
              UgtButtonWidget(
                title: negativeText,
                callback: () {
                  Get.back();
                  negativeAction!();
                },
                isPrimary: false,
              ),
              UgtButtonWidget(
                title: positiveText,
                callback: () {
                  Get.back();
                  positiveAction!();
                },
                isPrimary: true,
              )
            ],
          );
        });
  }

  static showUgtDeleteDialog({
    required BuildContext context,
    String title = 'Dikkat',
    String desc = 'Bu kaydı silmek istediğinizden emin misiniz?',
    String negativeText = "Hayır",
    String positiveText = "Evet",
    GestureTapCallback? negativeAction,
    GestureTapCallback? positiveAction,
  }) {
    showDialog(
        context: context,
        barrierColor: Colors.black54,
        barrierDismissible: true,
        useSafeArea: true,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsOverflowButtonSpacing: 20,
            actionsOverflowDirection: VerticalDirection.up,
            actionsPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentTextStyle: TextStyle(color: Colors.black87),
            title: Text(title),
            content: Text(desc),
            actions: [
              UgtButtonWidget(
                title: negativeText,
                callback: () {
                  Get.back();
                  negativeAction!();
                },
                isPrimary: false,
              ),
              UgtButtonWidget(
                title: positiveText,
                callback: () {
                  Get.back();
                  positiveAction!();
                },
                isPrimary: true,
              )
            ],
          );
        });
  }
}
