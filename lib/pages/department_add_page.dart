import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
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

class DepartmentAddPage extends StatefulWidget {
  @override
  _DepartmentAddPageState createState() => _DepartmentAddPageState();
}

class _DepartmentAddPageState extends State<DepartmentAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  DepartmentRequest _request = DepartmentRequest();
  TextEditingController _controllerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerName.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Departman Ekle"),
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
                          // UgtDropdownFetchWidget(
                          //   title: "Fakülte",
                          //   sourceUrl: c.URL_FACULTY_LIST,
                          //   handleClick: _handleFacultyClick,
                          // ),
                          UgtInputTextWidget(
                            hintText: "Departman adı",
                            onSaved: _handleNameSaved,
                            validator: _handleNameValidate,
                            controller: _controllerName,
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

  void _handleFacultyClick(item) {
    print(item);
    setState(() {
      _request.facultyId = item.id;
    });
  }

  void _handleNameSaved(value) {
    setState(() {
      _request.name = value!;
    });
  }

  String? _handleNameValidate(value) {
    if (value!.isEmpty) return "Lütfen departman adını giriniz";
    return null;
  }

  void _saveData() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() => _isLoading = true);
    var id = await UgtBaseNetwork.addGeneric(url: c.URL_DEPARTMENT_ADD, data: _request.toMap());
    setState(() => _isLoading = false);
    Get.offAndToNamed("${p.facultyEdit}?id=$id");
  }
}
