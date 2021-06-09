import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class OurLecturerListPage extends StatefulWidget {
  @override
  _OurLecturerListPageState createState() => _OurLecturerListPageState();
}

class _OurLecturerListPageState extends State<OurLecturerListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  // id olmali

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm Öğretim Görevlisi Listesi"),
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
