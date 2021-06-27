import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/models/lecture.dart';
import '../settings/page_codes.dart' as p;

class LectureListPage extends StatefulWidget {
  @override
  _LectureListPageState createState() => _LectureListPageState();
}

class _LectureListPageState extends State<LectureListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  List<Lecture> _lectures = <Lecture>[];
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
        title: Text("Ders Listesi"),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await Get.toNamed(p.lectureNew);
                _fetchData();
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
                : _lectures.length == 0
                    ? EmptyListWidget()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return _listRow(_lectures[index]);
                        },
                        itemCount: _lectures.length,
                      ),
          ),
        ),
      ),
    );
  }

  Widget _listRow(Lecture item) {
    return Container(
      padding: const EdgeInsets.only(bottom: 1, left: 10, right: 10, top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${item.code}"),
              SizedBox(width: 30),
              CircleAvatar(
                backgroundColor: item.statusId == 1 ? Colors.green : Colors.red,
                child: Icon(item.statusId == 1 ? Icons.check : Icons.snooze),
              ),
            ],
          ),
          title: Text("${item.name} - ${item.semester} - ${item.academicYear}. Dönem"),
          subtitle: Text(
            "${item.programName}\n${item.lecturerName}",
            overflow: TextOverflow.ellipsis,
          ),
          isThreeLine: true,
          tileColor: Colors.grey.withOpacity(0.1),
          onTap: () async {
            var result = await Get.toNamed("${p.lectureEdit}?id=${item.id}");
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
    var data = await UgtBaseNetwork.getLectures();
    print("we get data of ${data.length} rows");
    setState(() {
      _lectures = data;
      _isLoading = false;
    });
  }
}
