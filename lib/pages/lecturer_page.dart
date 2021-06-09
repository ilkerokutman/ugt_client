import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class LecturerPage extends StatefulWidget {
  @override
  _LecturerPageState createState() => _LecturerPageState();
}

class _LecturerPageState extends State<LecturerPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğretim Görevlisi Detayı"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("lecturer"),
        ),
      ),
    );
  }
}
