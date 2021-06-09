import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class LectureEditPage extends StatefulWidget {
  @override
  _LectureEditPageState createState() => _LectureEditPageState();
}

class _LectureEditPageState extends State<LectureEditPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders Düzenle"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("lecture edit"),
        ),
      ),
    );
  }
}
