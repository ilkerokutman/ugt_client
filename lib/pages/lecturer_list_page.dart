import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/lecturer.dart';
import '../settings/page_codes.dart' as p;

class LecturerListPage extends StatefulWidget {
  @override
  _LecturerListPageState createState() => _LecturerListPageState();
}

class _LecturerListPageState extends State<LecturerListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  List<Lecturer> _lecturers = <Lecturer>[];
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
        title: Text("Öğretim Görevlisi Listesi"),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await Get.toNamed(p.lecturerAdd);
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
                : _lecturers.length == 0
                    ? EmptyListWidget()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return _listRow(_lecturers[index]);
                        },
                        itemCount: _lecturers.length,
                      ),
          ),
        ),
      ),
    );
  }

  Widget _listRow(Lecturer item) {
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
          title: Text("${item.title} ${item.fullName}"),
          subtitle: Text(
            "${item.programName}, ${item.facultyName}",
            overflow: TextOverflow.ellipsis,
          ),
          tileColor: Colors.grey.withOpacity(0.1),
          onTap: () async {
            var result = await Get.toNamed("${p.lecturerEdit}?id=${item.id}");
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
    var data = await UgtBaseNetwork.getLecturers();
    print("we get data of ${data.length} rows");
    setState(() {
      _lecturers = data;
      _isLoading = false;
    });
  }
}
