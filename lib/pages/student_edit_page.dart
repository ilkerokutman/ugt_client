import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class StudentEditPage extends StatefulWidget {
  @override
  _StudentEditPageState createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  Auth auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ogrenci Duzenleme"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("student edit"),
        ),
      ),
    );
  }
}
