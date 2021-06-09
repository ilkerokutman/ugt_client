import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class LecturerAddPage extends StatefulWidget {
  @override
  _LecturerAddPageState createState() => _LecturerAddPageState();
}

class _LecturerAddPageState extends State<LecturerAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğretim Görevlisi Ekle"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("lecturer add"),
        ),
      ),
    );
  }
}
