import 'package:flutter/material.dart';

class UgtSectionTitleWidget extends StatelessWidget {
  final String title;
  const UgtSectionTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 22,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
    );
  }
}
