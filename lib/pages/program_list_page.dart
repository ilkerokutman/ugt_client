import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class ProgramListPage extends StatefulWidget {
  @override
  _ProgramListPageState createState() => _ProgramListPageState();
}

class _ProgramListPageState extends State<ProgramListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Program ve Bölüm Listesi"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("program and division list"),
        ),
      ),
    );
  }
}
