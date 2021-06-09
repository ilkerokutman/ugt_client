import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/btn_widget.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/helpers/utils.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/faculty.dart';
import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;

class FacultyEditPage extends StatefulWidget {
  @override
  _FacultyEditPageState createState() => _FacultyEditPageState();
}

class _FacultyEditPageState extends State<FacultyEditPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  String? id = Get.parameters["id"];
  GlobalKey<FormState> _formKey = GlobalKey();
  late Faculty _faculty;

  @override
  void initState() {
    super.initState();
    if (id == null) Get.back();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fakülte Düzenle"),
        actions: [
          IconButton(
            onPressed: _showDeleteDialog,
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
            child: _isLoading
                ? Center(child: LoadingWidget())
                : _faculty != null
                    ? _facultyForm()
                    : Center(child: EmptyListWidget(subject: "Fakülte"))),
      ),
    );
  }

  Widget _facultyForm() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fakülte Adı"),
                    TextFormField(
                      initialValue: _faculty.name,
                      decoration: InputDecoration(hintText: "fakülte adını yazınız"),
                      onSaved: (value) {
                        setState(() {
                          _faculty.name = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) return "Lütfen fakülte adını giriniz";
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Text("Yayın durumu"),
                    SwitchListTile(
                      title: Text(_faculty.statusId == 1 ? "Aktif" : "Pasif"),
                      value: _faculty.statusId == 1,
                      onChanged: (val) {
                        setState(() {
                          _faculty.statusId = val ? 1 : 0;
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    UgtButtonWidget(
                      title: "Kaydet",
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
        SizedBox(width: 50),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _infoTiles("ID:", _faculty.id ?? ""),
              _infoTiles("Oluşturma tarihi:", _faculty.createdOn ?? ""),
              _infoTiles("Değiştirme tarihi:", _faculty.modifiedOn ?? ""),
            ],
          ),
        ),
      ],
    );
  }

  Widget _infoTiles(String n, String v) {
    return Container(
      child: ListTile(
        title: Text(
          "$n",
          style: TextStyle(color: Colors.black45, fontSize: 12),
        ),
        subtitle: Text(
          "$v",
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ),
    );
  }

  Future<void> _saveData() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    if (mounted) setState(() => _isLoading = true);
    var response = await UgtBaseNetwork.saveFaculty(_faculty);
    print("we have a response: ${response!.toMap().toString()}");
    if (mounted) setState(() => _isLoading = false);
    setState(() {
      _faculty = response;
    });
    //Get.back();
  }

  Future<void> _fetchData() async {
    if (mounted) setState(() => _isLoading = true);
    var response = await UgtBaseNetwork.getFaculty(id!);
    if (mounted) setState(() => _isLoading = false);
    if (mounted) {
      setState(() {
        _faculty = response!;
      });
    }
  }

  Future<void> _delete() async {
    if (mounted) setState(() => _isLoading = true);
    var response = await UgtBaseNetwork.deleteFaculty(id!);
    if (mounted) setState(() => _isLoading = false);
    Get.back();
  }

  Future<void> _showDeleteDialog() async {
    UgtDialogs.showUgtDeleteDialog(context: context, positiveAction: _delete);
  }
}
