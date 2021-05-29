import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class FacultyAddPage extends StatefulWidget {
  @override
  _FacultyAddPageState createState() => _FacultyAddPageState();
}

class _FacultyAddPageState extends State<FacultyAddPage> {
  Auth auth = Box.readAuth();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Fakulte Ekle"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("faculty add"),
        ),
      ),
    );
  }
}
