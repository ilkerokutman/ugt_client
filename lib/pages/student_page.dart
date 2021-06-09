import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Detayı"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("student"),
        ),
      ),
    );
  }
}
