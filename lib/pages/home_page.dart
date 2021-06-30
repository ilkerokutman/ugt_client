import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';
import '../settings/page_codes.dart' as p;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Auth? auth = Box.readAuth();
  bool _isLoading = false;
  bool _dataLoaded = false;
  int lectureCount = 0;
  int studentCount = 0;
  int taskCount = 0;
  int taskAssigneeCount = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UGT"),
      ),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: Wrap(
            children: [
              _homeCard(title: "Verdiğim Dersler", path: p.myLectures, qty: "Toplam $lectureCount ders"),
              _homeCard(title: "Öğrencilerim", path: p.myStudents, qty: "Toplam $studentCount öğrenci"),
              _homeCard(
                  title: "Verdiğim Görevler", path: p.myLectures, qty: "$taskCount görev, $taskAssigneeCount kişi"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeCard({required String title, required String path, required String qty}) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Get.toNamed(path);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            color: Colors.grey.withOpacity(0.4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
                Text(qty),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadData() async {
    var myTasks = await UgtBaseNetwork.getMyAssignments(auth!.lecturer!.id!);
    var myStudents = await UgtBaseNetwork.getMyStudents(auth!.lecturer!.id!);
    var myLectures = await UgtBaseNetwork.getMyLectures(auth!.lecturer!.id!);
    setState(() {
      lectureCount = myLectures.length;
      studentCount = myStudents.length;
      taskCount = myTasks.length;
      taskAssigneeCount = taskCount * studentCount;
    });
  }
}
