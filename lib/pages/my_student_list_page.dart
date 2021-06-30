import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/student.dart';
import '../settings/page_codes.dart' as p;

class MyStudentListPage extends StatefulWidget {
  @override
  _MyStudentListPageState createState() => _MyStudentListPageState();
}

class _MyStudentListPageState extends State<MyStudentListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  List<Student> _students = <Student>[];
  GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Listesi"),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await Get.toNamed(p.studentAdd);
                // _fetchData();
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: RefreshIndicator(
            key: _refreshKey,
            onRefresh: _fetchData,
            child: _isLoading
                ? LoadingWidget()
                : _students.length == 0
                    ? EmptyListWidget()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return _listRow(_students[index]);
                        },
                        itemCount: _students.length,
                      ),
          ),
        ),
      ),
    );
  }

  Widget _listRow(Student item) {
    return Container(
      padding: const EdgeInsets.only(bottom: 1, left: 10, right: 10, top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing: CircleAvatar(
            backgroundColor: item.statusId == 1 ? Colors.green : Colors.red,
            child: Icon(item.statusId == 1 ? Icons.check : Icons.snooze),
          ),
          
          title: Text("${item.studentNumber} ${item.fullName}"),
          subtitle: Text("${item.programName} [${item.grade}.dönem], ${item.facultyName}",
            overflow: TextOverflow.ellipsis,
          ),
          
          tileColor: Colors.grey.withOpacity(0.1),
          onTap: () async {
            var result = await Get.toNamed("${p.studentEdit}?id=${item.id}");
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
    var data = await UgtBaseNetwork.getMyStudents(auth!.lecturer!.id!);
    print("we get data of ${data.length} rows");
    setState(() {
      _students = data;
      _isLoading = false;
    });
  }
}
