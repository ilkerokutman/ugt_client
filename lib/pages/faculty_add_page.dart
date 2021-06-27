import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class FacultyAddPage extends StatefulWidget {
  @override
  _FacultyAddPageState createState() => _FacultyAddPageState();
}

class _FacultyAddPageState extends State<FacultyAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Fakülte Ekle"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: _isLoading
                ? LoadingWidget()
                : ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: d.formMaxWidth),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Fakülte Adı"),
                          TextFormField(
                            decoration: InputDecoration(hintText: "fakülte adını yazınız"),
                            onSaved: (value) {
                              setState(() {
                                name = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) return "Lütfen fakülte adını giriniz";
                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                          UgtButtonWidget(
                            title: "İleri",
                            isPrimary: true,
                            floatRight: true,
                            callback: _saveData,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _saveData() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() => _isLoading = true);
    var id = await UgtBaseNetwork.addGeneric(url: c.URL_FACULTY_ADD, data: {"name": name});
    setState(() => _isLoading = false);
    Get.offAndToNamed("${p.facultyEdit}?id=$id");
  }
}
