import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class ManageAdminPage extends StatefulWidget {
  @override
  _ManageAdminPageState createState() => _ManageAdminPageState();
}

class _ManageAdminPageState extends State<ManageAdminPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yönetici Detayı"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Text("admin list"),
        ),
      ),
    );
  }
}
