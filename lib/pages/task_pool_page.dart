import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class TaskPoolPage extends StatefulWidget {
  @override
  _TaskPoolPageState createState() => _TaskPoolPageState();
}

class _TaskPoolPageState extends State<TaskPoolPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Görev Havuzu"),
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
