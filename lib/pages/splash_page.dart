import 'package:flutter/material.dart';

import '../settings/strings.dart' as s;
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

  
}
