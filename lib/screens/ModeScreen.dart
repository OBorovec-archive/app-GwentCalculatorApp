import 'package:flutter/material.dart';
import './HalfBoardScreen.dart';
import './FullBoardScreen.dart';

class ModePage extends StatelessWidget {
  ModePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: width,
              height: height / 2,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HalfBoardScreen()),
                  );
                },
                color: Colors.grey,
                child: Text(
                  "Half board",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height / 2,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FullBoardScreen()),
                  );
                },
                child: Text(
                  "Full board",
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
