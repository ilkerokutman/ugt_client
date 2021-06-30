import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/assignment.dart';
import 'package:ugt_client/models/auth.dart';
import '../settings/dimens.dart' as d;
import '../settings/page_codes.dart' as p;
import '../settings/constants.dart' as c;

class MyTaskListPage extends StatefulWidget {
  final int isPool;
  MyTaskListPage({this.isPool = 0});
  @override
  _MyTaskListPageState createState() => _MyTaskListPageState();
}

class _MyTaskListPageState extends State<MyTaskListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  List<Assignment> _assignments = <Assignment>[];
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
        title: Text(widget.isPool == 1 ? "Görev Havuzu" : "Görev Listesi"),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAndToNamed(p.taskPool);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: RefreshIndicator(
            key: _refreshKey,
            onRefresh: _fetchData,
            child: _isLoading
                ? LoadingWidget()
                : _assignments.length == 0
                    ? EmptyListWidget()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return _listRow(_assignments[index]);
                        },
                        itemCount: _assignments.length,
                      ),
          ),
        ),
      ),
    );
  }

  Widget _listRow(Assignment item) {
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
          title: Text("${item.title}"),
          subtitle: Text(
            "${item.lectureName} - ${item.lecturerName}\n${item.programName} [${item.academicYear}.dönem]",
            overflow: TextOverflow.ellipsis,
          ),
          isThreeLine: true,
          tileColor: Colors.grey.withOpacity(0.1),
          onTap: () async {
            var result = await Get.toNamed("${p.taskEdit}?id=${item.id}");
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
    var data = await UgtBaseNetwork.getMyAssignments(auth!.lecturer!.id!);
    print("we get data of ${data.length} rows");
    setState(() {
      _assignments = data;
      _isLoading = false;
    });
  }
}
