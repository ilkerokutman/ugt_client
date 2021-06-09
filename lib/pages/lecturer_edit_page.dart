import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class LecturerEditPage extends StatefulWidget {
  @override
  _LecturerEditPageState createState() => _LecturerEditPageState();
}

class _LecturerEditPageState extends State<LecturerEditPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğretim Görevlisi Düzenle"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("lecturer edit"),
        ),
      ),
    );
  }
}
