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
import 'package:ugt_client/models/lecturer.dart';
import 'package:ugt_client/models/requests.dart';

import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class LecturerEditPage extends StatefulWidget {
  @override
  _LecturerEditPageState createState() => _LecturerEditPageState();
}

class _LecturerEditPageState extends State<LecturerEditPage> {
  bool _isLoading = false;
  bool _dataLoaded = false;
  String? _id = Get.parameters["id"];
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerTitle = TextEditingController();
  Lecturer? _lecturer;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğretim Görevlisi Detayı"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.vpn_key)),
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
                                  UgtButtonWidget(
                                    title: "Ders Listesine Git",
                                    callback: () {},
                                    isPrimary: false,
                                  ),
                                  Divider(),
                                  UgtSectionTitleWidget(title: "Bilgileri Düzenle"),
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
                                  UgtDropdownFetchWidget(
                                    title: "Rol ve Yetki",
                                    sourceUrl: c.URL_ROLE_LIST_HIGH,
                                    handleClick: _onRoleClick,
                                    selectedId: _lecturer!.roleId,
                                    selectedText: _lecturer!.role,
                                  ),
                                  UgtSwitchWidget(
                                    label: "Yayın Durumu",
                                    value: _lecturer!.statusId == 1,
                                    onChanged: _onStatusClick,
                                  ),
                                  UgtDropdownFetchWidget(
                                    title: "Program",
                                    sourceUrl: c.URL_DAP_LIST,
                                    handleClick: _onProgramClick,
                                    selectedId: _lecturer!.programId,
                                    selectedText: _lecturer!.programName,
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
                                    value: _lecturer!.createdOn,
                                  ),
                                  NameValueRow(
                                    label: "Düzenleme Tarihi",
                                    value: _lecturer!.modifiedOn,
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
      _lecturer!.firstName = value;
    });
  }

  _onSavedLastName(String value) {
    setState(() {
      _lecturer!.lastName = value;
    });
  }

  _onSavedTitle(String value) {
    setState(() {
      _lecturer!.title = value;
    });
  }

  _onSavedEmail(String value) {
    setState(() {
      _lecturer!.email = value;
    });
  }

  _onSavedPhone(String value) {
    setState(() {
      _lecturer!.phone = value;
    });
  }

  _onProgramClick(item) {
    setState(() {
      _lecturer!.programId = item.id;
    });
  }

  _onRoleClick(item) {
    setState(() {
      _lecturer!.role = item.id;
    });
  }

  void _onStatusClick(bool value) {
    setState(() {
      _lecturer!.statusId = value ? 1 : 0;
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
    var newData = await UgtBaseNetwork.saveLecturer(_lecturer!.toMap());
    setState(() {
      _isLoading = false;
      _lecturer = newData;
    });
  }

  Future<void> _deleteItem() async {
    UgtDialogs.showUgtDeleteDialog(
        context: context,
        positiveAction: () async {
          await UgtBaseNetwork.deleteGeneric(url: c.URL_LECTURER_DELETE, id: _lecturer!.id!);
          Get.back(result: 1);
        });
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    var lecturer = await UgtBaseNetwork.getLecturer(_id!);
    setState(() {
      _lecturer = lecturer;
      _isLoading = false;
      _dataLoaded = lecturer != null;
    });
  }
}
