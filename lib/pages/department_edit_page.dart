import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class DepartmentEditPage extends StatefulWidget {
  @override
  _DepartmentEditPageState createState() => _DepartmentEditPageState();
}

class _DepartmentEditPageState extends State<DepartmentEditPage> {
  Auth auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Departman Edit"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("department edit"),
        ),
      ),
    );
  }
}
