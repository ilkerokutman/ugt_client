import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../settings/page_codes.dart' as p;

class UgtMenuItemWidget extends StatelessWidget {
  final String title;
  final String url;
  final IconData? icon;
  UgtMenuItemWidget({
    required this.title,
    required this.url,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          '$title',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
        ),
        leading: icon != null ? Icon(icon) : null,
        onTap: () {
          url == p.home ? Get.offAllNamed(p.home) : Get.toNamed(url);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        horizontalTitleGap: 4,
        dense: true,
        enableFeedback: true,
        selected: ModalRoute.of(context)!.settings.name!.contains(url),
        selectedTileColor: Colors.blueGrey[200],
      ),
    );
  }
}
