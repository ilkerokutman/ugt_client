import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/components/ugt_dropdown_fetch_widget.dart';
import 'package:ugt_client/components/ugt_input_text_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/requests.dart';

import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class LecturerAddPage extends StatefulWidget {
  @override
  _LecturerAddPageState createState() => _LecturerAddPageState();
}

class _LecturerAddPageState extends State<LecturerAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerTitle = TextEditingController();
  LecturerRequest _request = LecturerRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğretim Görevlisi Ekle"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: _isLoading
                ? LoadingWidget()
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: d.formMaxWidth),
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UgtInputTextWidget(
                                hintText: "İsim",
                                onSaved: _onSavedFirstName,
                                validator: _emptyValidator,
                                controller: _controllerFirstName,
                                keyboardType: TextInputType.name,
                              ),
                              UgtInputTextWidget(
                                hintText: "Soyisim",
                                onSaved: _onSavedLastName,
                                validator: _emptyValidator,
                                controller: _controllerLastName,
                                keyboardType: TextInputType.name,
                              ),
                              UgtInputTextWidget(
                                hintText: "Ünvan",
                                onSaved: _onSavedTitle,
                                validator: _emptyValidator,
                                controller: _controllerTitle,
                                keyboardType: TextInputType.name,
                              ),
                              UgtInputTextWidget(
                                hintText: "Telefon",
                                onSaved: _onSavedPhone,
                                validator: _emptyValidator,
                                controller: _controllerPhone,
                                keyboardType: TextInputType.phone,
                              ),
                              UgtInputTextWidget(
                                hintText: "E-posta Adresi",
                                onSaved: _onSavedEmail,
                                validator: _emptyValidator,
                                controller: _controllerEmail,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              UgtInputTextWidget(
                                hintText: "Şifre",
                                onSaved: _onSavedPassword,
                                validator: _emptyValidator,
                                controller: _controllerPassword,
                              ),
                              UgtDropdownFetchWidget(
                                title: "Rol ve Yetki",
                                sourceUrl: c.URL_ROLE_LIST_HIGH,
                                handleClick: _onRoleClick,
                              ),
                              UgtDropdownFetchWidget(
                                title: "Program",
                                sourceUrl: c.URL_DAP_LIST,
                                handleClick: _onProgramClick,
                              ),
                              SizedBox(height: 30),
                              UgtButtonWidget(
                                title: "İleri",
                                isPrimary: true,
                                floatRight: true,
                                callback: _saveData,
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  _onSavedFirstName(String value) {
    setState(() {
      _request.firstName = value;
    });
  }

  _onSavedLastName(String value) {
    setState(() {
      _request.lastName = value;
    });
  }

  _onSavedTitle(String value) {
    setState(() {
      _request.title = value;
    });
  }

  _onSavedEmail(String value) {
    setState(() {
      _request.email = value;
    });
  }

  _onSavedPassword(String value) {
    setState(() {
      _request.password = value;
    });
  }

  _onSavedPhone(String value) {
    setState(() {
      _request.phone = value;
    });
  }

  _onProgramClick(item) {
    setState(() {
      _request.programId = item.id;
    });
  }


  _onRoleClick(item) {
    setState(() {
      _request.role = item.id;
    });
  }

  String? _emptyValidator(String value) {
    if (value.isEmpty) return "Bu alanı boş bırakamazsınız";
    return null;
  }

  Future<void> _saveData() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() => _isLoading = true);
    var id = await UgtBaseNetwork.addGeneric(url: c.URL_LECTURER_ADD, data: _request.toMap());
    setState(() => _isLoading = false);
    Get.offAndToNamed("${p.lecturerEdit}?id=$id");
  }
}
