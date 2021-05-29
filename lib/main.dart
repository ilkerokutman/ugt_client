import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ugt_client/pages/admin_list_page.dart';
import 'package:ugt_client/pages/lecture_add_page.dart';
import 'package:ugt_client/pages/lecture_edit_page.dart';
import 'package:ugt_client/pages/lecture_list_page.dart';
import 'package:ugt_client/pages/lecture_page.dart';
import 'package:ugt_client/pages/my_profile_page.dart';

import './settings/page_codes.dart' as p;
import './pages/splash_page.dart';
import './pages/signin_page.dart';
import './pages/home_page.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(UGT());
}

class UGT extends StatefulWidget {
  @override
  _UGTState createState() => _UGTState();
}

class _UGTState extends State<UGT> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)
      ),
      getPages: [
        GetPage(name: p.splash, page: () => SplashPage()),
        GetPage(name: p.signin, page: () => SigninPage()),
        GetPage(name: p.home, page: () => HomePage()),
        GetPage(name: p.myProfile, page: () => MyProfilePage()),
        GetPage(name: p.manageAdminList, page: () => ManageAdminListPage()),
        GetPage(name: p.lecture, page: () => LecturePage()),
        GetPage(name: p.lectureList, page: () => LectureListPage()),
        GetPage(name: p.lectureNew, page: () => LectureAddPage()),
        GetPage(name: p.lectureEdit, page: () => LectureEditPage()),
      ],
      initialRoute: p.splash,
    );
  }
}
