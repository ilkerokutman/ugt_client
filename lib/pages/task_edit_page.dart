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
import 'package:ugt_client/models/assignment.dart';
import 'package:ugt_client/models/auth.dart';

import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class TaskEditPage extends StatefulWidget {
  @override
  _TaskEditPageState createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  bool _isLoading = false;
  bool _dataLoaded = false;
  String? _id = Get.parameters["id"];
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerAssets = TextEditingController();
  Assignment? _assignment;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Görev Düzenle"),
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
                              child: _assignment!.isTemplate == 1 ? _templateView() : _taskView(),
                            ),
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }

  Widget _templateView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UgtSectionTitleWidget(title: "İşlemler"),
        UgtButtonWidget(
          title: "Kopya oluştur",
          callback: () async {
            var result = await UgtBaseNetwork.copyAssignment(_id!);
            Get.offAndToNamed("${p.taskEdit}?id=$result");
          },
          isPrimary: false,
        ),
        Divider(),
        UgtSectionTitleWidget(title: "Bilgileri Düzenle"),
        UgtInputTextWidget(
          hintText: "Görevin Adi",
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
          hintText: "Belgeler",
          onSaved: _onSavedDescription,
          validator: _emptyValidator,
          controller: _controllerAssets,
          keyboardType: TextInputType.name,
        ),
        UgtSwitchWidget(
          label: "Yayın Durumu",
          value: _assignment!.statusId == 1,
          onChanged: _onStatusClick,
        ),
        UgtDropdownFetchWidget(
          title: "Program",
          sourceUrl: c.URL_DAP_LIST,
          handleClick: _onProgramClick,
          selectedId: _assignment!.programId,
          selectedText: _assignment!.programName,
        ),
        UgtDropdownFetchWidget(
          title: "Ders",
          sourceUrl: c.URL_LECTURE_LIST,
          handleClick: _onProgramClick,
          selectedId: _assignment!.lectureId,
          selectedText: _assignment!.lectureName,
        ),
        UgtDropdownFetchWidget(
          title: "Öğretim Görevlisi",
          sourceUrl: c.URL_LECTURER_LIST,
          handleClick: _onProgramClick,
          selectedId: _assignment!.lecturerId,
          selectedText: _assignment!.lecturerName,
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
        // NameValueRow(
        //   label: "Oluşturma Tarihi",
        //   value: _assignment!.createdOn,
        // ),
        // NameValueRow(
        //   label: "Düzenleme Tarihi",
        //   value: _assignment!.modifiedOn,
        // ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _taskView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UgtSectionTitleWidget(title: "İşlemler"),
        UgtButtonWidget(
          title: "Görevi Alan Öğrenci Listesi",
          callback: () {
            Get.toNamed("${p.taskDetail}?id=$_id");
          },
          isPrimary: false,
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
        UgtSwitchWidget(
          label: "Yayın Durumu",
          value: _assignment!.statusId == 1,
          onChanged: _onStatusClick,
        ),
        UgtDropdownFetchWidget(
          title: "Program",
          sourceUrl: c.URL_DAP_LIST,
          handleClick: _onProgramClick,
          selectedId: _assignment!.programId,
          selectedText: _assignment!.programName,
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
        // NameValueRow(
        //   label: "Oluşturma Tarihi",
        //   value: _assignment!.createdOn,
        // ),
        // NameValueRow(
        //   label: "Düzenleme Tarihi",
        //   value: _assignment!.modifiedOn,
        // ),
        SizedBox(height: 30),
      ],
    );
  }

  _onSavedName(String value) {
    setState(() {
      _assignment!.title = value;
    });
  }

  _onSavedDescription(String value) {
    setState(() {
      _assignment!.description = value;
    });
  }

  _onProgramClick(item) {
    setState(() {
      _assignment!.programId = item.id;
    });
  }

  _onStatusClick(bool value) {
    setState(() {
      _assignment!.statusId = value ? 1 : 0;
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
    var newData = await UgtBaseNetwork.saveAssignment(_assignment!.toMap());
    setState(() {
      _isLoading = false;
      _assignment = newData;
    });
  }

  Future<void> _deleteItem() async {
    UgtDialogs.showUgtDeleteDialog(
        context: context,
        positiveAction: () async {
          await UgtBaseNetwork.deleteGeneric(url: c.URL_ASSIGNMENT_DELETE, id: _assignment!.id!);
          Get.back(result: 1);
        });
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });
    var data = await UgtBaseNetwork.getAssignment(_id!);
    setState(() {
      _assignment = data;
      _dataLoaded = data != null;
      _isLoading = false;
      _controllerName.text = data!.title!;
      _controllerDescription.text = data.description!;
      _controllerAssets.text = data.assetUrl!;
    });
  }
}
