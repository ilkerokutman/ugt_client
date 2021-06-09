import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class ManageAdminEditPage extends StatefulWidget {
  @override
  _ManageAdminEditPageState createState() => _ManageAdminEditPageState();
}

class _ManageAdminEditPageState extends State<ManageAdminEditPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yönetici Düzenle"),
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
