import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/models/credentials.dart';
import '../settings/strings.dart' as s;
import '../settings/page_codes.dart' as p;

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  Credentials _credentials = Credentials(username: '', password: '');
  bool _isLoading = false;
  String signinStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 400, maxWidth: 300),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(s.titleSigninPage, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                        SizedBox(height: 30),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Eposta"),
                          onSaved: (value) {
                            setState(() {
                              _credentials.username = value;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) return "Lütfen eposta adresinizi giriniz";
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Şifre"),
                          obscureText: true,
                          onSaved: (value) {
                            setState(() {
                              _credentials.password = value;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) return "Lütfen şifrenizi giriniz";
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: _submit,
                          child: Text("Giriş"),
                        ),
                        Container(
                          child: Center(
                            child: Text(signinStatus),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _isLoading ? Center(child: CircularProgressIndicator()) : Container(),
          ],
        ),
      ),
    );
  }

  _submit() async {
    setState(() {
      signinStatus = "";
    });
    if (!_formKey.currentState.validate()) {
      return null;
    }

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    var auth = await UgtBaseNetwork.userSignin(_credentials);
    setState(() {
      _isLoading = false;
    });
    if (auth == null) {
      setState(() {
        signinStatus = "hatali kullanici ya da sifre";
      });
    } else {
      setState(() {
        signinStatus = "giris basarili, lutfen bekleyin";
      });
      Get.offAllNamed(p.home);
    }
  }
}
