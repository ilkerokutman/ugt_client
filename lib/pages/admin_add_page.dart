import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class ManageAdminAddPage extends StatefulWidget {
  @override
  _ManageAdminAddPageState createState() => _ManageAdminAddPageState();
}

class _ManageAdminAddPageState extends State<ManageAdminAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Yönetici Ekle"),
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
