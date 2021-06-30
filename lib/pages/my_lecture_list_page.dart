import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/models/lecture.dart';
import 'package:ugt_client/models/menu_choice.dart';
import '../settings/page_codes.dart' as p;

class MyLectureListPage extends StatefulWidget {
  @override
  _MyLectureListPageState createState() => _MyLectureListPageState();
}

class _MyLectureListPageState extends State<MyLectureListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  List<Lecture> _lectures = <Lecture>[];
  GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();
  List<Choice> choices = <Choice>[];

  @override
  void initState() {
    super.initState();
    _fetchData();
    choices.add(Choice(title: 'Öğrenci Listesi', path: '${p.students}?lecturerId=${auth!.lecturer!.id}'));
    choices.add(Choice(title: 'Ders Bilgileri', path: ''));
    choices.add(Choice(title: 'Ders Görevleri', path: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders Listem"),
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
              PopupMenuButton<Choice>(
                onSelected: _select,
                itemBuilder: (context) {
                  return choices.map((Choice choice) {
                    return PopupMenuItem<Choice>(
                      value: choice,
                      child: Text(choice.title),
                    );
                  }).toList();
                },
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

  void _select(Choice choice) {
    Get.toNamed(choice.path);
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    var data = await UgtBaseNetwork.getMyLectures(auth!.lecturer!.id!);
    print("we get data of ${data.length} rows");
    setState(() {
      _lectures = data;
      _isLoading = false;
    });
  }
}
