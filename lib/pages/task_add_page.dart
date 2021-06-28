import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/components/ugt_dropdown_fetch_widget.dart';
import 'package:ugt_client/components/ugt_dropdown_widget.dart';
import 'package:ugt_client/components/ugt_input_text_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/helpers/utils.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/requests.dart';
import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class TaskAddPage extends StatefulWidget {
  @override
  _TaskAddPageState createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllertitle = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  AssignmentRequest _request = AssignmentRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ders Ekle"),
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
                                hintText: "Dersin Adı",
                                onSaved: _onSavedName,
                                validator: _emptyValidator,
                                controller: _controllertitle,
                                keyboardType: TextInputType.name,
                              ),
                              UgtInputTextWidget(
                                hintText: "Açıklama",
                                onSaved: _onSavedDescription,
                                validator: _emptyValidator,
                                controller: _controllerDescription,
                                keyboardType: TextInputType.name,
                              ),
                              UgtDropdownFetchWidget(
                                title: "Program / Bölüm",
                                sourceUrl: c.URL_DAP_LIST,
                                handleClick: _onProgramClick,
                              ),
                              UgtDropdownFetchWidget(
                                title: "Öğretim Görevlisi",
                                sourceUrl: c.URL_LECTURER_LIST,
                                handleClick: _onLecturerClick,
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

  _onSavedName(String value) {
    setState(() {
      _request.title = value;
    });
  }

  _onSavedDescription(String value) {
    setState(() {
      _request.description = value;
    });
  }

  _onProgramClick(item) {
    setState(() {
      // _request.program = item.id;
    });
  }

  _onLecturerClick(item) {
    setState(() {
      // _request.lecturer = item.id;
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
    var id = await UgtBaseNetwork.addGeneric(url: c.URL_LECTURE_ADD, data: _request.toMap());
    setState(() => _isLoading = false);
    Get.offAndToNamed("${p.taskEdit}?id=$id");
  }
}
