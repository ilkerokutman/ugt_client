import 'package:flutter/material.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class MyTasksPage extends StatefulWidget {
  @override
  _MyTasksPageState createState() => _MyTasksPageState();
}

class _MyTasksPageState extends State<MyTasksPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Görevlerim"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
