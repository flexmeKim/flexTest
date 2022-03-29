import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NameTest extends StatefulWidget {
  @override
  _NameTestState createState() => _NameTestState();
}

class _NameTestState extends State<NameTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("t"),
      ),
      body: Column(
        children: [Text("123")],
      ),
    );
  }
}
