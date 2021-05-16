import 'package:flutter/material.dart';
import 'package:ugt_client/controllers/base_network.dart';
import 'package:ugt_client/models/credentials.dart';

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text("title"),
                      TextFormField(
                        decoration: InputDecoration(hintText: "EMAIL"),
                        onSaved: (value) {
                          setState(() {
                            _credentials.username = value;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) return "Lutfen eposta adresinizi giriniz";
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "SIFRE"),
                        onSaved: (value) {
                          setState(() {
                            _credentials.password = value;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) return "Lutfen sifrenizi giriniz";
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text("SUBMIT"),
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
    }
  }
}
