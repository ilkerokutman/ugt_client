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
import 'package:ugt_client/models/student_detail.dart';
import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class StudentDetailPage extends StatefulWidget {
  @override
  _StudentDetailPageState createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  bool _isLoading = false;
  bool _dataLoaded = false;
  String? _id = Get.parameters["id"];
  StudentDetail? _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Detayı"),
      ),
      body: SafeArea(
        child: Container(
          child: _isLoading
              ? LoadingWidget()
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _studentDetail(),
                        _studentLectures(),
                        _studentAssignments(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _studentDetail() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UgtSectionTitleWidget(title: "Öğrenci Bilgileri"),
          NameValueRow(
            label: "Adı, Soyadı",
            value: _data!.student!.fullName,
          ),
          NameValueRow(
            label: "Numarası",
            value: _data!.student!.studentNumber,
          ),
          NameValueRow(
            label: "Fakülte",
            value: _data!.student!.facultyName,
          ),
          NameValueRow(
            label: "Program",
            value: _data!.student!.programName,
          ),
          NameValueRow(
            label: "Sınıf",
            value: _data!.student!.grade.toString(),
          ),
        ],
      ),
    );
  }

  Widget _studentLectures() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UgtSectionTitleWidget(title: "Aldığı Dersler"),
          _data!.lectures!.length > 0 ? Column(children: _lectureListWidget()) : Text("Ders bulunmuyor"),
        ],
      ),
    );
  }

  List<Widget> _lectureListWidget() {
    List<Widget> w = <Widget>[];
    for (var i = 0; i < _data!.lectures!.length; i++) {
      w.add(_rowLecture(i));
      w.add(Divider());
    }
    return w;
  }

  List<Widget> _taskListWidget() {
    List<Widget> w = <Widget>[];
    for (var i = 0; i < _data!.assingments!.length; i++) {
      w.add(_rowAssignments(i));
      w.add(Divider());
    }
    return w;
  }

  Widget _rowLecture(int index) {
    return NameValueRow(
      label: "${_data!.lectures![index].code} - ${_data!.lectures![index].name} (${_data!.lectures![index].academicYear}. Dönem)",
      value: _data!.lectures![index].lecturerName,
    );
  }

  Widget _rowAssignments(int index) {
    return NameValueRow(
      label:
          "${_data!.assingments![index].title} (${_data!.assingments![index].dueFrom} - ${_data!.assingments![index].dueTo})",
      value:
          "${_data!.assingments![index].description}\n${_data!.assingments![index].lectureName} - ${_data!.assingments![index].lecturerName}\nDurum: ${_data!.assingments![index].statusId==0?'Devam Ediyor':'Tamamlandı'}",
    );
  }

  Widget _studentAssignments() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UgtSectionTitleWidget(title: "Aldığı Görevler"),
          _data!.assingments!.length > 0
              ? Column(
                  children: _taskListWidget(),
                )
              : Text("Görev Bulunmuyor"),
        ],
      ),
    );
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });
    var data = await UgtBaseNetwork.getStudentDetail(_id!);
    setState(() {
      _data = data;
      _isLoading = false;
    });
  }
}
