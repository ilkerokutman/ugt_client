import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String text;
  LoadingWidget({this.text = 'Yükleniyor'});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text(text),
          ],
        ),
      ),
    );
  }
}
