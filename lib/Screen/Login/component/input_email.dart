import 'package:flutter/material.dart';
import 'package:selibu/Screen/Login/component/text_field.dart';

class InputEmail extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onchanged;
  const InputEmail({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onchanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0XFF838383),
          ),
          hintText: hintText,
          border: InputBorder.none
        ),
      ),
    );
  }
}

