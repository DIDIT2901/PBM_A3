import 'package:flutter/material.dart';
import 'package:selibu/Screen/Login/component/text_field.dart';

class input_password extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const input_password({
    Key? key, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color(0xFF838383),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Color(0xFF838383),
          ),
          border: InputBorder.none
        )
      ),
    );
  }
}

