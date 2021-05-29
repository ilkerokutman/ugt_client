import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class DepartmentAddPage extends StatefulWidget {
  @override
  _DepartmentAddPageState createState() => _DepartmentAddPageState();
}

class _DepartmentAddPageState extends State<DepartmentAddPage> {
  Auth auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Departman Ekle"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("department add"),
        ),
      ),
    );
  }
}
