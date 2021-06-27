import 'package:flutter/material.dart';

class UgtInputTextWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Function onSaved;
  final Function validator;
  TextEditingController? controller;
  UgtInputTextWidget({
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.onSaved,
    required this.validator,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    if (controller == null) controller = TextEditingController();
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          color: Colors.grey.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$hintText",
                style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14, fontWeight: FontWeight.w300),
              ),
              TextFormField(
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.35),
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),

                ),
                keyboardType: keyboardType,
                onSaved: (val) {
                  onSaved(val);
                },
                validator: (val) {
                  validator(val);
                },

                controller: controller,
                enableInteractiveSelection: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
