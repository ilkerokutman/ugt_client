import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class ProgramAddPage extends StatefulWidget {
  @override
  _ProgramAddPageState createState() => _ProgramAddPageState();
}

class _ProgramAddPageState extends State<ProgramAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Program ve Bölüm Ekle"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("program and division add"),
        ),
      ),
    );
  }
}
