import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/components/empty_list_widget.dart';
import 'package:ugt_client/components/loading_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/main.dart';
import 'package:ugt_client/models/auth.dart';
import 'package:ugt_client/models/department.dart';
import '../settings/page_codes.dart' as p;

class DepartmentListPage extends StatefulWidget {
  @override
  _DepartmentListPageState createState() => _DepartmentListPageState();
}

class _DepartmentListPageState extends State<DepartmentListPage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  late Future _future;
  GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _future = _fetchData();

    WidgetsBinding.instance!.addObserver(
      LifecycleEventHandler(
        resumeCallBack: () async => setState(() {
          print("RESUMING");
        }),
        suspendingCallBack: () async => setState(() {
          print("SUSPENDING");
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Departman Listesi"),
        actions: [
          IconButton(onPressed: _openAddPage, icon: Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: RefreshIndicator(
            key: _refreshKey,
            onRefresh: _refresh,
            child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasData && snapshot.data != null) {
                      var departmentListData = snapshot.data as List<Department>;
                      if (departmentListData.length > 0) {
                        return _departmentList(departmentListData);
                      } else {
                        return EmptyListWidget();
                      }
                    } else {
                      return EmptyListWidget();
                    }
                  default:
                    return LoadingWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _departmentList(List<Department> data) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(bottom: 1, left: 10, right: 10, top: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              trailing: CircleAvatar(
                backgroundColor: data[index].statusId == 1 ? Colors.green : Colors.red,
                child: Icon(data[index].statusId == 1 ? Icons.check : Icons.snooze),
              ),
              title: Text("${data[index].name}"),
              tileColor: Colors.grey.withOpacity(0.1),
              onTap: () async {
                print("toName: ${p.departmentEdit}?id=${data[index].id}");
                var result = await Get.toNamed("${p.departmentEdit}?id=${data[index].id}");
                _refresh();
              },
            ),
          ),
        );
      },
      itemCount: data.length,
    );
  }

  Future<List<Department>> _fetchData() async {
    var data = await UgtBaseNetwork.listDepartments();
    print("we get data of ${data.length} rows");
    return data;
  }

  Future<void> _openAddPage() async {
    Future.delayed(Duration.zero, () async {
      var result = await Get.toNamed(p.departmentAdd);
      setState(() {});
    });
  }

  Future<void> _refresh() async {
    setState(() {
      _future = _fetchData();
    });
  }
}
