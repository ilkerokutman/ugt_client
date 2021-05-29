import 'package:flutter/material.dart';

class UgtInputTextWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Function onSaved;
  final Function validator;
  final TextEditingController controller;
  UgtInputTextWidget({
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.validator,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          color: Colors.grey.withOpacity(0.1),
          child: Center(
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 17, color: Colors.blueGrey),
              ),
              keyboardType: keyboardType,
              onSaved: onSaved,
              validator: validator,
              controller: controller,
              enableInteractiveSelection: true,
            ),
          ),
        ),
      ),
    );
  }
}
