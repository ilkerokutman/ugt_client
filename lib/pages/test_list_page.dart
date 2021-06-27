import 'package:flutter/material.dart';
import 'package:ugt_client/components/drawer_widget.dart';
import 'package:ugt_client/models/student.dart';

class TestListPage extends StatefulWidget {
  @override
  _TestListPageState createState() => _TestListPageState();
}

class _TestListPageState extends State<TestListPage> {
  List<Student> _testItems = [];

  @override
  void initState() {
    super.initState();
    _populateTestItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: UgtDrawer(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: Center(
                    child: Text("filtreler"),
                  ),
                  color: Colors.green,
                ),
                Container(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: _testItems.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _populateTestItems() {
    List<Student> testItems = <Student>[];
   
    setState(() => _testItems = testItems);
  }
}
