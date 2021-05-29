import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class ProgramEditPage extends StatefulWidget {
  @override
  _ProgramEditPageState createState() => _ProgramEditPageState();
}

class _ProgramEditPageState extends State<ProgramEditPage> {
  Auth auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Program ve Bolum Duzenleme"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("program and division edit"),
        ),
      ),
    );
  }
}
