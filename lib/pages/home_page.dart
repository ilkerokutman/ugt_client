import 'package:flutter/material.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Auth auth = Box.readAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UGT : ${auth.lecturer.title} ${auth.fullName}"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text("home"),
          ),
        ),
      ),
    );
  }
}
