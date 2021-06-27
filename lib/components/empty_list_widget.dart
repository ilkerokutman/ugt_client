import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  final String subject;
  EmptyListWidget({this.subject = 'öğe'});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Center(
            child: Text("Görüntülenecek $subject bulunamadı."),
          ),
        ),
        ListView(
          children: [],
        )
      ],
    );
  }
}
