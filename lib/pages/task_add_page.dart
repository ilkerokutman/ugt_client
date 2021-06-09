import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class TaskAddPage extends StatefulWidget {
  @override
  _TaskAddPageState createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Görev Ekle"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("student list"),
        ),
      ),
    );
  }
}
