import 'package:flutter/material.dart';

class HalfBoardScreen extends StatefulWidget {
  const HalfBoardScreen({Key key}) : super(key: key);

  @override
  _HalfBoardScreenState createState() => _HalfBoardScreenState();
}

class _HalfBoardScreenState extends State<HalfBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Half board"),
      ),
      body: Container(color: Colors.grey),
    );
  }
}
