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
  late Future _futureLectureList;
  // id olmali

  @override
  void initState() {
    super.initState();
    _futureLectureList = _listLectures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders Listesi"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed(p.lectureNew);
            },
          ),
        ],
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder(
            future: _futureLectureList,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData && snapshot.data != null) {
                    List<Lecture> _data = snapshot.data as List<Lecture>;
                    if (_data.length > 0) {
                      return _lectureListScreen(_data);
                    } else {
                      return Container(
                        child: Column(
                          children: [
                            _lectureFilters(),
                            Expanded(child: EmptyListWidget(subject: 'Ders')),
                          ],
                        ),
                      );
                    }
                  } else {
                    return Container(
                      child: Column(
                        children: [
                          _lectureFilters(),
                          Expanded(child: EmptyListWidget(subject: 'Ders')),
                        ],
                      ),
                    );
                  }
                  break;
                default:
                  return LoadingWidget(
                    text: 'Dersler yükleniyor',
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<Lecture>> _listLectures() async {
    var lectureList = await UgtBaseNetwork.listLectures();
    return lectureList;
  }

  Widget _lectureListScreen(List<Lecture> lectures) {
    return Container(
      child: Column(
        children: [
          _lectureFilters(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _lectureItem(lectures[index]);
              },
              itemCount: lectures.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _lectureFilters() {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.green[50],
      child: Center(
        child: Text("filters"),
      ),
    );
  }

  Widget _lectureItem(Lecture lecture) {
    return ListTile(
      title: Text(lecture.name ?? ""),
      subtitle: Text("${lecture.code} ${lecture.academicYear}"),
      onTap: () {
        _openLecture(lecture.id ?? "");
      },
    );
  }

  void _openLecture(String id) {
    Get.toNamed("${p.lecture}?id=$id");
  }
}
