import 'package:flutter/material.dart';

class NameValueRow extends StatelessWidget {
  final String? label;
  final String? value;
  const NameValueRow({
    Key? key,
    this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("$label"),
        subtitle: Text("$value"),
      ),
    );
  }
}
