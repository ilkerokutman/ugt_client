import 'package:flutter/material.dart';

class UgtButtonWidget extends StatelessWidget {
  final String title;
  final bool isPrimary;
  final bool isBlock;
  final bool floatRight;
  final Function callback;
  const UgtButtonWidget({
    required this.title,
    this.isPrimary = false,
    this.isBlock = false,
    this.floatRight = false,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isBlock
        ? Container(
            width: double.infinity,
            child: btn(),
          )
        : floatRight
            ? Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: btn(),
                ),
              )
            : Container(
                child: btn(),
              );
  }

  Widget btn() {
    return isPrimary
        ? ElevatedButton(
            onPressed: () {
              callback();
            },
            child: Text("$title"),
          )
        : ElevatedButton(
            onPressed: () {
              callback();
            },
            child: Text("$title"),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
            ),
          );
  }
}
