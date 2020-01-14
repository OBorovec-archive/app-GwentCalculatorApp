import 'package:flutter/material.dart';
import 'package:gwent_calculator/screens/HalfBoardScreen.dart';
import 'package:gwent_calculator/screens/FullBoardScreen.dart';

class ModePage extends StatelessWidget {
  ModePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: width,
                height: height / 2,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalfBoardScreen()),
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
                      MaterialPageRoute(
                          builder: (context) => FullBoardScreen()),
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
          Center(
            child: Hero(
              tag: 'gwent_icon',
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                child: Image(
                  image: AssetImage(
                    'assets/images/gwintklub.png',
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
