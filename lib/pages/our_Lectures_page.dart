import 'package:flutter/material.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class OurLecturesPage extends StatefulWidget {
  @override
  _OurLecturesPageState createState() => _OurLecturesPageState();
}

class _OurLecturesPageState extends State<OurLecturesPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm Dersleri"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
