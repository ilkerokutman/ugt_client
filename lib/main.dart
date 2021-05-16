import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './settings/page_codes.dart' as p;
import './pages/splash_page.dart';

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
      ],
      initialRoute: p.splash,
    );
  }
}
