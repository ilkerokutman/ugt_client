import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/components/name_value_row.dart';
import 'package:ugt_client/components/ugt_dropdown_fetch_widget.dart';
import 'package:ugt_client/components/ugt_input_text_widget.dart';
import 'package:ugt_client/components/ugt_switch_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/helpers/utils.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/program_and_division.dart';
import 'package:ugt_client/models/requests.dart';

import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class ProgramEditPage extends StatefulWidget {
  @override
  _ProgramEditPageState createState() => _ProgramEditPageState();
}

class _ProgramEditPageState extends State<ProgramEditPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  bool _dataLoaded = false;
  String? _id = Get.parameters["id"];
  GlobalKey<FormState> _formKey = GlobalKey();
  ProgramAndDivision? _program;
  TextEditingController _controllerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Program ve Bölüm Düzenle"),
        actions: [IconButton(onPressed: _deleteItem, icon: Icon(Icons.delete))],
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: _isLoading
                ? LoadingWidget()
                : !_dataLoaded
                    ? EmptyListWidget()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: d.formMaxWidth),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UgtDropdownFetchWidget(
                                      title: "Fakülte",
                                      sourceUrl: c.URL_FACULTY_LIST,
                                      handleClick: _handleFacultyClick,
                                      selectedId: _program!.facultyId,
                                      selectedText: _program!.facultyName,
                                    ),
                                    UgtInputTextWidget(
                                      hintText: "Program / Bölüm Adı",
                                      onSaved: _handleNameSaved,
                                      validator: _handleNameValidate,
                                      controller: _controllerName,
                                    ),
                                    UgtSwitchWidget(
                                      label: "Yayın Durumu",
                                      value: _program!.statusId == 1,
                                      onChanged: _handleStatusSwitch,
                                    ),
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
                                      value: _program!.createdOn,
                                    ),
                                    NameValueRow(
                                      label: "Düzenleme Tarihi",
                                      value: _program!.modifiedOn,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
      _program!.facultyId = item.id;
    });
  }

  void _handleNameSaved(String value) {
    setState(() {
      _program!.name = value;
    });
  }

  void _handleStatusSwitch(bool value) {
    setState(() {
      _program!.statusId = value ? 1 : 0;
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
    var newData = await UgtBaseNetwork.saveProgram(_program!.toMap());
    setState(() {
      _isLoading = false;
      _program = newData;
    });
  }

  Future<void> _deleteItem() async {
    UgtDialogs.showUgtDeleteDialog(
        context: context,
        positiveAction: () async {
          await UgtBaseNetwork.deleteGeneric(url: c.URL_DAP_DELETE, id: _program!.id!);
          Get.back(result: 1);
        });
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });
    var data = await UgtBaseNetwork.getProgram(_id!);
    setState(() {
      _program = data;
      _dataLoaded = data != null;
      _isLoading = false;
      _controllerName.text = data!.name!;
    });
  }
}
