import 'package:flutter/material.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class MyStudentsPage extends StatefulWidget {
  @override
  _MyStudentsPageState createState() => _MyStudentsPageState();
}

class _MyStudentsPageState extends State<MyStudentsPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrencilerim"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
