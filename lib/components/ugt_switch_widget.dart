import 'package:flutter/material.dart';

class UgtSwitchWidget extends StatelessWidget {
  final String label;
  final bool value;
  final Function onChanged;
  const UgtSwitchWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 19),
          color: Colors.grey.withOpacity(0.1),
          child: Center(
            child: SwitchListTile(
              title: Text('${label}'),
              value: value,
              onChanged: (val) {
                onChanged(val);
              },
              // secondary: value ? Icon(Icons.lightbulb) : Icon(Icons.lightbulb_outline),
            ),
          ),
        ),
      ),
    );
  }
}
