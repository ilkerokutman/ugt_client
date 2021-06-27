import 'package:flutter/material.dart';
import 'package:ugt_client/models/db_entity.dart';

class UgtDropdownWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<PopupMenuEntry<DbEntity>> itemBuilder;
  final Function handleClick;
  UgtDropdownWidget({
    required this.title,
    this.subtitle = 'Seçilmedi',
    required this.itemBuilder,
    required this.handleClick,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: Colors.grey.withOpacity(0.1),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: PopupMenuButton(
            icon: Icon(Icons.arrow_drop_down),
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => itemBuilder,
          ),
        ),
      ),
    );
  }
}
