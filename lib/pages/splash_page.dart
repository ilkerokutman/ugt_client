import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/controllers/base_network.dart';

import '../settings/strings.dart' as s;
import '../settings/page_codes.dart' as p;
import '../models/credentials.dart';
import '../helpers/box.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Credentials? _credentials;

  @override
  void initState() {
    super.initState();
    var crd = Box.readCredentials();
    if (crd != null) {
      _credentials = crd;

      tryLogin();
    } else {
      gotoSignin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(s.loading),
        ),
      ),
    );
  }

  Future<void> tryLogin() async {
    if (_credentials == null) {
      print("move to singin, credentials is empty");
      gotoSignin();
      return;
    }
    var auth = await UgtBaseNetwork.userSignin(_credentials!);
    if (auth != null) {
      print("auth: ${auth.accessToken}");
      print("move to home");
      gotoHome();
    } else {
      print("move to signin");
      gotoSignin();
    }
  }

  Future<void> gotoSignin() async {
    Future.delayed(Duration(milliseconds: 300), () {
      Get.offAndToNamed(p.signin);
    });
  }

  Future<void> gotoHome() async {
    Future.delayed(Duration.zero, () {
      Get.offAndToNamed(p.home);
    });
  }
}
