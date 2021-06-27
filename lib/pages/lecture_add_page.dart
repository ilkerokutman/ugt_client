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

class LectureAddPage extends StatefulWidget {
  @override
  _LectureAddPageState createState() => _LectureAddPageState();
}

class _LectureAddPageState extends State<LectureAddPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerCode = TextEditingController();
  TextEditingController _controllerCredits = TextEditingController();
  TextEditingController _controllerSemester = TextEditingController();
  TextEditingController _controllerAcademicYear = TextEditingController();
  LectureRequest _request = LectureRequest();
  int _ayFrom = DateTime.now().year - 10;
  int _ayTo = DateTime.now().year + 10;

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
                                controller: _controllerName,
                                keyboardType: TextInputType.name,
                              ),
                              UgtInputTextWidget(
                                hintText: "Açıklama",
                                onSaved: _onSavedDescription,
                                validator: _emptyValidator,
                                controller: _controllerDescription,
                                keyboardType: TextInputType.name,
                              ),
                              UgtInputTextWidget(
                                hintText: "Ders Kodu",
                                onSaved: _onSavedCode,
                                validator: _emptyValidator,
                                controller: _controllerCode,
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
                              UgtDropdownWidget(
                                itemBuilder: WUtils.builderIntDropdownItems(from: 0, to: 40),
                                title: "Kredi",
                                subtitle: "${_request.credits != null ? _request.credits : 'Seçilmedi'}",
                                handleClick: _onCreditsClick,
                              ),
                              UgtDropdownWidget(
                                itemBuilder: WUtils.builderSemesterDropdownItems(),
                                title: "Sömester",
                                subtitle: "${_request.semester != null ? _request.semester : 'Seçilmedi'}",
                                handleClick: _onSemesterClick,
                              ),
                              UgtDropdownWidget(
                                itemBuilder: WUtils.builderIntDropdownItems(from: 1, to: 8),
                                title: "Akademik Yıl",
                                subtitle: "${_request.academicYear != null ? _request.academicYear : 'Seçilmedi'}",
                                handleClick: _onAcademicYearClick,
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
      _request.name = value;
    });
  }

  _onSavedCode(String value) {
    setState(() {
      _request.code = value;
    });
  }

  _onSavedDescription(String value) {
    setState(() {
      _request.description = value;
    });
  }

  _onProgramClick(item) {
    setState(() {
      _request.program = item.id;
    });
  }

  _onCreditsClick(item) {
    setState(() {
      _request.credits = int.parse(item.id);
    });
  }

  _onSemesterClick(item) {
    setState(() {
      _request.semester = item.id;
    });
  }

  _onAcademicYearClick(item) {
    setState(() {
      _request.academicYear = int.parse(item.id);
    });
  }

  _onLecturerClick(item) {
    setState(() {
      _request.lecturer = item.id;
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
    Get.offAndToNamed("${p.lectureEdit}?id=$id");
  }
}
