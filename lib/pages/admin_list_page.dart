import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class ManageAdminListPage extends StatefulWidget {
  @override
  _ManageAdminListPageState createState() => _ManageAdminListPageState();
}

class _ManageAdminListPageState extends State<ManageAdminListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yönetici Listesi"),
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
