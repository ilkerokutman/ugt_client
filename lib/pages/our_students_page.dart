import 'package:flutter/material.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class OurStudentsPage extends StatefulWidget {
  @override
  _OurStudentsPageState createState() => _OurStudentsPageState();
}

class _OurStudentsPageState extends State<OurStudentsPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm Öğrencileri"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
