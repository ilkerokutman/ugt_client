import 'package:flutter/material.dart';

class UgtMenuItemWidget extends StatelessWidget {
  String title;
  String url;
  IconData icon;
  UgtMenuItemWidget({
    @required this.title,
    @required this.url,
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
          print(url);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        horizontalTitleGap: 4,
        dense: true,
        enableFeedback: true,
        selected: ModalRoute.of(context).settings.name.contains(url),
        selectedTileColor: Colors.blueGrey[200],
        
        
      ),
    );
  }
}
