import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/components/name_value_row.dart';
import 'package:ugt_client/components/ugt_dropdown_fetch_widget.dart';
import 'package:ugt_client/components/ugt_input_text_widget.dart';
import 'package:ugt_client/components/ugt_section_title_widget.dart';
import 'package:ugt_client/components/ugt_switch_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/helpers/utils.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/lecture.dart';

import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class LectureEditPage extends StatefulWidget {
  @override
  _LectureEditPageState createState() => _LectureEditPageState();
}

class _LectureEditPageState extends State<LectureEditPage> {
  bool _isLoading = false;
  bool _dataLoaded = false;
  String? _id = Get.parameters["id"];
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerCode = TextEditingController();
  Lecture? _lecture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders Düzenle"),
        actions: [
          IconButton(onPressed: _deleteItem, icon: Icon(Icons.delete)),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: _isLoading
              ? LoadingWidget()
              : !_dataLoaded
                  ? EmptyListWidget()
                  : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Center(
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
                                  UgtSectionTitleWidget(title: "İşlemler"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      UgtButtonWidget(
                                        title: "Dersi Alan Öğrenci Listesi",
                                        callback: () {},
                                        isPrimary: false,
                                      ),
                                      UgtButtonWidget(
                                        title: "Derse Ait Görevler",
                                        callback: () {},
                                        isPrimary: false,
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  UgtSectionTitleWidget(title: "Bilgileri Düzenle"),
                                  UgtInputTextWidget(
                                    hintText: "Dersin Adi",
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
                                  UgtSwitchWidget(
                                    label: "Yayın Durumu",
                                    value: _lecture!.statusId == 1,
                                    onChanged: _onStatusClick,
                                  ),
                                  UgtDropdownFetchWidget(
                                    title: "Program",
                                    sourceUrl: c.URL_DAP_LIST,
                                    handleClick: _onProgramClick,
                                    selectedId: _lecture!.programId,
                                    selectedText: _lecture!.programName,
                                  ),
                                  SizedBox(height: 30),
                                  UgtButtonWidget(
                                    title: "Kaydet",
                                    isPrimary: true,
                                    floatRight: true,
                                    callback: _saveData,
                                  ),
                                  SizedBox(height: 50),
                                  Divider(),
                                  NameValueRow(
                                    label: "Oluşturma Tarihi",
                                    value: _lecture!.createdOn,
                                  ),
                                  NameValueRow(
                                    label: "Düzenleme Tarihi",
                                    value: _lecture!.modifiedOn,
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
      _lecture!.name = value;
    });
  }

  _onSavedDescription(String value) {
    setState(() {
      _lecture!.description = value;
    });
  }

  _onSavedCode(String value) {
    setState(() {
      _lecture!.code = value;
    });
  }

  _onProgramClick(item) {
    setState(() {
      _lecture!.programId = item.id;
    });
  }

  _onStatusClick(bool value) {
    setState(() {
      _lecture!.statusId = value ? 1 : 0;
    });
  }

  String? _emptyValidator(String value) {
    if (value.isEmpty) return "Bu alanı boş bırakamazsınız";
    return null;
  }

  void _saveData() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() => _isLoading = true);
    var newData = await UgtBaseNetwork.saveLecture(_lecture!.toMap());
    setState(() {
      _isLoading = false;
      _lecture = newData;
    });
  }

  Future<void> _deleteItem() async {
    UgtDialogs.showUgtDeleteDialog(
        context: context,
        positiveAction: () async {
          await UgtBaseNetwork.deleteGeneric(url: c.URL_LECTURE_DELETE, id: _lecture!.id!);
          Get.back(result: 1);
        });
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });
    var data = await UgtBaseNetwork.getLecture(_id!);
    setState(() {
      _lecture = data;
      _dataLoaded = data != null;
      _isLoading = false;
      _controllerName.text = data!.name!;
      _controllerDescription.text = data.description!;
      _controllerCode.text = data.code!;
    });
  }
}
