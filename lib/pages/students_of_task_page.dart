import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/components/ugt_section_title_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/assignment.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/students_of_assignments.dart';
import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class StudentsOfTaskPage extends StatefulWidget {
  @override
  _StudentsOfTaskPageState createState() => _StudentsOfTaskPageState();
}

class _StudentsOfTaskPageState extends State<StudentsOfTaskPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();
  AssignmentDetail? _data = AssignmentDetail();
  String? _id = Get.parameters["id"];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Görevi Alan Öğrenciler"),
      ),
      body: SafeArea(
        child: Container(
          child: RefreshIndicator(
            key: _refreshKey,
            onRefresh: _fetchData,
            child: _isLoading
                ? LoadingWidget()
                : Column(
                    children: [
                      UgtSectionTitleWidget(title: "Detay"),
                      // _taskDetailRow(_data!.assignment!.title!),
                      // _taskDetailRow(_data!.assignment!.description!),
                      // _taskDetailRow(
                      //     "${_data!.assignment!.lectureName!}, ${_data!.assignment!.academicYear!}.dönem ${_data!.assignment!.programName!}, ${_data!.assignment!.lecturerName!}"),
                      Divider(),
                      UgtSectionTitleWidget(title: "Öğrenciler"),
                      // Expanded(child: _taskStudents()),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _taskDetailRow(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 2),
      child: Text(
        "$text",
        textAlign: TextAlign.left,
      ),
    );
  }

  // Widget _taskStudents() {
  //   return _data!.students!.length == 0
  //       ? EmptyListWidget()
  //       : ListView.builder(
  //           itemBuilder: (context, index) {
  //             var d = _data!.students;
  //             return _listRow(d![index]);
  //           },
  //           itemCount: _data!.students!.length,
  //         );
  // }

  Widget _listRow(StudentsOfAssignments? item) {
    return Container(
      padding: const EdgeInsets.only(bottom: 1, left: 10, right: 10, top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing: CircleAvatar(
            backgroundColor: item!.statusId == 1 ? Colors.green : Colors.red,
            child: Icon(item.statusId == 1 ? Icons.check : Icons.snooze),
          ),
          title: Text("${item.studentNumber} ${item.studentName}"),
          subtitle: Text(
            "${item.dueFrom} - ${item.dueTo}",
            overflow: TextOverflow.ellipsis,
          ),
          tileColor: Colors.grey.withOpacity(0.1),
          onTap: () async {
            var result = await Get.toNamed("${p.studentDetail}?id=${item.id}");
            _fetchData();
          },
        ),
      ),
    );
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    // var data = await UgtBaseNetwork.getStudentOfAssignments(_id!);
    setState(() {
      // _data = data;
      _isLoading = false;
    });
  }
}
