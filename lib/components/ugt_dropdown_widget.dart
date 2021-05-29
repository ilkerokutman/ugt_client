import 'package:flutter/material.dart';

class UgtDropdownWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function picker;
  UgtDropdownWidget({
    this.title,
    this.subtitle = 'Seçilmedi',
    this.picker,
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
          trailing: IconButton(
            icon: Icon(Icons.arrow_drop_down),
            onPressed: picker,
          ),
        ),
      ),
    );
  }
}
