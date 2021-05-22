import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
      ),
      getPages: [
        GetPage(name: p.splash, page: () => SplashPage()),
        GetPage(name: p.signin, page: () => SigninPage()),
        GetPage(name: p.home, page: () => HomePage()),
        GetPage(name: p.myProfile, page: () => MyProfilePage()),
      ],
      initialRoute: p.splash,
    );
  }
}
