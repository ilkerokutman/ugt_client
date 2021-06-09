import 'package:flutter/material.dart';

class UgtMenuLabelWidget extends StatelessWidget {
  final String title;
  UgtMenuLabelWidget({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: Colors.grey.withOpacity(0.1),
      child: Text(
        "$title",
        style: TextStyle(color: Colors.black.withOpacity(0.9), fontSize: 12, fontWeight: FontWeight.w300),
      ),
    );
  }
}
