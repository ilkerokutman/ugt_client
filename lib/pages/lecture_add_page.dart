import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/ugt_dropdown_widget.dart';
import 'package:ugt_client/components/ugt_input_text_widget.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class LectureAddPage extends StatefulWidget {
  @override
  _LectureAddPageState createState() => _LectureAddPageState();
}

class _LectureAddPageState extends State<LectureAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ders Ekle"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _submit,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    children: [
                      UgtInputTextWidget(
                        controller: TextEditingController(),
                        hintText: 'Ders adı',
                        keyboardType: TextInputType.text,
                        onSaved: (val) {
                          //onsaved
                        },
                        validator: (val) {
                          //...
                        },
                      ),
                      UgtInputTextWidget(
                        controller: TextEditingController(),
                        hintText: 'Ders açıklaması',
                        keyboardType: TextInputType.text,
                        onSaved: (val) {
                          //onsaved
                        },
                        validator: (val) {
                          //...
                        },
                      ),
                      UgtInputTextWidget(
                        controller: TextEditingController(),
                        hintText: 'Ders Kodu',
                        keyboardType: TextInputType.text,
                        onSaved: (val) {
                          //onsaved
                        },
                        validator: (val) {
                          //...
                        },
                      ),
                      UgtDropdownWidget(
                        title: 'Kredi Miktarı',
                        subtitle: '0',
                        picker: () {
                          //...
                        },
                      ),
                      UgtDropdownWidget(
                        title: 'Sömestr',
                        subtitle: 'Seçilmedi',
                        picker: () {
                          //...
                        },
                      ),
                      UgtDropdownWidget(
                        title: 'Akademik Yıl',
                        subtitle: 'Seçilmedi',
                        picker: () {
                          //...
                        },
                      ),
                      UgtDropdownWidget(
                        title: 'Öğretim Görevlisi',
                        subtitle: 'Seçilmedi',
                        picker: () {
                          //...
                        },
                      ),
                      UgtDropdownWidget(
                        title: 'Fakülte',
                        subtitle: 'Seçilmedi',
                        picker: () {
                          //...
                        },
                      ),
                      UgtDropdownWidget(
                        title: 'Departman',
                        subtitle: 'Seçilmedi',
                        picker: () {
                          //...
                        },
                      ),
                      UgtDropdownWidget(
                        title: 'Program',
                        subtitle: 'Seçilmedi',
                        picker: () {
                          //...
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void _submit() async {
    //...
  }
}
