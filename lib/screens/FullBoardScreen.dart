import 'package:flutter/material.dart';

class FullBoardScreen extends StatefulWidget {
  const FullBoardScreen({ Key key }) : super(key: key);

  @override
  _FullBoardScreenState createState() => _FullBoardScreenState();
}

class _FullBoardScreenState extends State<FullBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full board"),
      ),
      body: Container(color: Colors.white),
    );
  }
}
