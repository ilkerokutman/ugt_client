import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/main.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/faculty.dart';
import 'package:ugt_client/models/program_and_division.dart';
import '../settings/page_codes.dart' as p;

class ProgramListPage extends StatefulWidget {
  @override
  _ProgramListPageState createState() => _ProgramListPageState();
}

class _ProgramListPageState extends State<ProgramListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  List<ProgramAndDivision> _programs = <ProgramAndDivision>[];
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
        title: Text("Program Listesi"),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await Get.toNamed(p.programAdd);
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
                : _programs.length == 0
                    ? EmptyListWidget()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return _listRow(_programs[index]);
                        },
                        itemCount: _programs.length,
                      ),
          ),
        ),
      ),
    );
  }

  Widget _listRow(ProgramAndDivision item) {
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
          title: Text("${item.name}"),
          subtitle: Text("${item.facultyName}"),
          tileColor: Colors.grey.withOpacity(0.1),
          onTap: () async {
            var result = await Get.toNamed("${p.programEdit}?id=${item.id}");
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
    var data = await UgtBaseNetwork.listPrograms();
    print("we get data of ${data.length} rows");
    setState(() {
      _programs = data;
      _isLoading = false;
    });
  }
}
