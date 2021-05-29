import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  final String subject;
  EmptyListWidget({this.subject});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Görüntülenecek $subject bulunamadı."),
      ),
    );
  }
}
