import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class FacultyEditPage extends StatefulWidget {
  @override
  _FacultyEditPageState createState() => _FacultyEditPageState();
}

class _FacultyEditPageState extends State<FacultyEditPage> {
  Auth auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fakulte Edit"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("faculty edit"),
        ),
      ),
    );
  }
}
