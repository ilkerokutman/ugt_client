import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/components/name_value_row.dart';
import 'package:ugt_client/components/ugt_dropdown_fetch_widget.dart';
import 'package:ugt_client/components/ugt_dropdown_widget.dart';
import 'package:ugt_client/components/ugt_input_text_widget.dart';
import 'package:ugt_client/components/ugt_section_title_widget.dart';
import 'package:ugt_client/components/ugt_switch_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/helpers/utils.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/student.dart';
import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class StudentEditPage extends StatefulWidget {
  @override
  _StudentEditPageState createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  bool _isLoading = false;
  bool _dataLoaded = false;
  String? _id = Get.parameters["id"];
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerStudentNumber = TextEditingController();
  TextEditingController _controllerEntranceDate = TextEditingController();
  Student? _student;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Düzenleme"),
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UgtSectionTitleWidget(title: "İşlemler"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    UgtButtonWidget(
                                      title: "Ders Listesine Git",
                                      callback: () {},
                                      isPrimary: false,
                                    ),
                                    UgtButtonWidget(
                                      title: "Görev Listesine Git",
                                      callback: () {},
                                      isPrimary: false,
                                    ),
                                  ],
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
                                UgtDropdownWidget(
                                  itemBuilder: WUtils.builderYearDropdownItems(),
                                  title: "Doğum Yılı",
                                  subtitle: "${_student!.yearOfBirth}",
                                  handleClick: _onYearClick,
                                ),
                                UgtDropdownFetchWidget(
                                  title: "Program",
                                  sourceUrl: c.URL_DAP_LIST,
                                  handleClick: _onProgramClick,
                                  selectedId: _student!.programId,
                                  selectedText: _student!.programName,
                                ),
                                UgtInputTextWidget(
                                  hintText: "Öğrenci No Adresi",
                                  onSaved: _onSavedStudentNumber,
                                  validator: _emptyValidator,
                                  controller: _controllerStudentNumber,
                                  keyboardType: TextInputType.number,
                                ),
                                UgtDropdownFetchWidget(
                                  title: "Program",
                                  sourceUrl: c.URL_DAP_LIST,
                                  handleClick: _onProgramClick,
                                  selectedId: _student!.programId,
                                  selectedText: _student!.programName,
                                ),
                                UgtDropdownWidget(
                                  title: "Dönem",
                                  subtitle: "${_student!.grade}",
                                  handleClick: _onGradeClick,
                                  itemBuilder: WUtils.builderGradeDropdownItems(),
                                ),
                                UgtInputTextWidget(
                                  hintText: "Okula Giriş Tarihi",
                                  onSaved: _onSavedEntranceDate,
                                  validator: _emptyValidator,
                                  controller: _controllerEntranceDate,
                                  keyboardType: TextInputType.text,
                                ),
                                UgtSwitchWidget(
                                  label: "Yayın Durumu",
                                  value: _student!.statusId == 1,
                                  onChanged: _onStatusClick,
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
                                  value: _student!.createdOn,
                                ),
                                NameValueRow(
                                  label: "Düzenleme Tarihi",
                                  value: _student!.modifiedOn,
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
    );
  }

  _onSavedFirstName(String value) {
    setState(() {
      _student!.firstName = value;
    });
  }

  _onSavedLastName(String value) {
    setState(() {
      _student!.lastName = value;
    });
  }

  _onSavedEmail(String value) {
    setState(() {
      _student!.email = value;
    });
  }

  _onSavedPhone(String value) {
    setState(() {
      _student!.phone = value;
    });
  }

  _onSavedStudentNumber(String value) {
    setState(() {
      _student!.studentNumber = value;
    });
  }

  _onSavedEntranceDate(String value) {
    setState(() {
      _student!.entranceDate = value;
    });
  }

  _onProgramClick(item) {
    setState(() {
      _student!.programId = item.id;
    });
  }

  _onYearClick(item) {
    setState(() {
      _student!.yearOfBirth = item.id;
    });
  }

  _onGradeClick(item) {
    setState(() {
      _student!.grade = item.id;
    });
  }

  void _onStatusClick(bool value) {
    setState(() {
      _student!.statusId = value ? 1 : 0;
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
    var newData = await UgtBaseNetwork.saveStudent(_student!.toMap());
    setState(() {
      _isLoading = false;
      _student = newData;
    });
  }

  Future<void> _deleteItem() async {
    UgtDialogs.showUgtDeleteDialog(
        context: context,
        positiveAction: () async {
          await UgtBaseNetwork.deleteGeneric(url: c.URL_STUDENT_DELETE, id: _student!.id!);
          Get.back(result: 1);
        });
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });
    var data = await UgtBaseNetwork.getStudent(_id!);
    setState(() {
      _student = data;
      _dataLoaded = data != null;
      _isLoading = false;
      _controllerFirstName.text = data!.firstName!;
      _controllerLastName.text = data.lastName!;
      _controllerEmail.text = data.email!;
      _controllerPhone.text = data.phone!;
      _controllerStudentNumber.text = data.studentNumber!;
      _controllerEntranceDate.text = data.entranceDate!;
    });
  }
}
