import 'package:flutter/material.dart';

class SwitchAcc extends StatefulWidget {
  const SwitchAcc({ Key? key }) : super(key: key);

  @override
  State<SwitchAcc> createState() => _SwitchAccState();
}

class _SwitchAccState extends State<SwitchAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Ini Tampilan Switch Account"),
    );
  }
}