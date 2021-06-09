import 'package:flutter/material.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class OurLecturersPage extends StatefulWidget {
  @override
  _OurLecturersPageState createState() => _OurLecturersPageState();
}

class _OurLecturersPageState extends State<OurLecturersPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm Öğretim Görevlileri"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
