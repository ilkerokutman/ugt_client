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
  Credentials _credentials;

  @override
  void initState() {
    super.initState();
    _credentials = Box.readCredentials();
    tryLogin();
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
    var auth = await UgtBaseNetwork.userSignin(_credentials);
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
    Future.delayed(Duration.zero, () {
      Get.offAndToNamed(p.signin);
    });
  }


  Future<void> gotoHome() async {
    Future.delayed(Duration.zero, () {
      Get.offAndToNamed(p.home);
    });
  }
}
