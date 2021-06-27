import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/models/db_entity.dart';

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

class WUtils {
  static Future<List<PopupMenuEntry<DbEntity>>> loadDropdownItems(
      {required String url, Map<String, dynamic>? data}) async {
    var list = await UgtBaseNetwork.fetchDropdownItems(url: url, data: data);
    var response = <PopupMenuEntry<DbEntity>>[];
    for (var i = 0; i < list.length; i++) {
      response.add(PopupMenuItem<DbEntity>(
        value: DbEntity(id: list[i].id, name: list[i].name),
        child: Text("${list[i].name}"),
      ));
    }
    return response;
  }

  static List<PopupMenuEntry<DbEntity>> buildDropdownItems(List<DbEntity> items) {
    var response = <PopupMenuEntry<DbEntity>>[];
    for (var i = 0; i < items.length; i++) {
      response.add(PopupMenuItem<DbEntity>(
        value: DbEntity(id: items[i].id, name: items[i].name),
        child: Text("${items[i].name}"),
      ));
    }
    return response;
  }

  static List<PopupMenuEntry<DbEntity>> builderYearDropdownItems() {
    var list = <PopupMenuEntry<DbEntity>>[];
    int year = DateTime.now().year;
    for (var i = 0; i < 90; i++) {
      list.add(PopupMenuItem<DbEntity>(
        value: DbEntity(id: "${year - i}", name: "${year - i}"),
        child: Text("${year - i}"),
      ));
    }
    return list;
  }

  static List<PopupMenuEntry<DbEntity>> builderGradeDropdownItems() {
    var list = <PopupMenuEntry<DbEntity>>[];
    for (var i = 1; i < 17; i++) {
      list.add(PopupMenuItem<DbEntity>(
        value: DbEntity(id: "${i}", name: "${i}"),
        child: Text("${i}. Dönem"),
      ));
    }
    return list;
  }

  static List<PopupMenuEntry<DbEntity>> builderSemesterDropdownItems() {
    var list = <PopupMenuEntry<DbEntity>>[];

    list.add(PopupMenuItem<DbEntity>(
      value: DbEntity(id: "Güz", name: "Güz"),
      child: Text("Güz"),
    ));
    list.add(PopupMenuItem<DbEntity>(
      value: DbEntity(id: "Bahar", name: "Bahar"),
      child: Text("Bahar"),
    ));
    list.add(PopupMenuItem<DbEntity>(
      value: DbEntity(id: "Yaz", name: "Yaz"),
      child: Text("Yaz"),
    ));
    list.add(PopupMenuItem<DbEntity>(
      value: DbEntity(id: "Yıl", name: "Yıl"),
      child: Text("Yıl"),
    ));
    return list;
  }

  static List<PopupMenuEntry<DbEntity>> builderIntDropdownItems(
      {required int from, required int to, bool reversed = false}) {
    var list = <PopupMenuEntry<DbEntity>>[];
    if (reversed) {
      for (var i = to; i >= from; i--) {
        list.add(PopupMenuItem<DbEntity>(
          value: DbEntity(id: "$i", name: "$i"),
          child: Text("$i"),
        ));
      }
    } else {
      for (var i = from; i <= to; i++) {
        list.add(PopupMenuItem<DbEntity>(
          value: DbEntity(id: "$i", name: "$i"),
          child: Text("$i"),
        ));
      }
    }
    return list;
  }
}
