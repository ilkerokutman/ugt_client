import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class LecturerListPage extends StatefulWidget {
  @override
  _LecturerListPageState createState() => _LecturerListPageState();
}

class _LecturerListPageState extends State<LecturerListPage> {
  Auth auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ogretim Gorevlisi Listesi"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("lecturer list"),
        ),
      ),
    );
  }
}
