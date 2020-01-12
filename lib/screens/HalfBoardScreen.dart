import 'package:flutter/material.dart';
import 'package:gwent_calculator/widgets/CompleteCardLine.dart';
import 'package:gwent_calculator/widgets/CardLine.dart';
import 'package:gwent_calculator/widgets/PlayCard.dart';
import 'package:gwent_calculator/data/CardData.dart';

class HalfBoardScreen extends StatefulWidget {
  const HalfBoardScreen({Key key}) : super(key: key);

  @override
  _HalfBoardScreenState createState() => _HalfBoardScreenState();
}

class _HalfBoardScreenState extends State<HalfBoardScreen> {
  List<CardData> frontLine = [];
  List<CardData> backLine = [];
  List<CardData> artileryLine = [];
  List<CardData> options = [
    new CardData(value: 1),
    new CardData(value: 2),
    new CardData(value: 3),
    new CardData(value: 4),
    new CardData(value: 5),
    new CardData(value: 6),
    new CardData(value: 7),
    new CardData(value: 8),
    new CardData(value: 9),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Half board"),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
              splashColor: Colors.white,
              onTap: () {},
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.backup,
                  color: Colors.white,
                ),
              ),
              splashColor: Colors.white,
              onTap: () {},
            )
          ],
        ),
        body: Container(
          color: Colors.grey,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CompleteCardLine(
                        lineTitle: 'Front line',
                        cardLine: frontLine,
                        onCardsAdded: (cardData) {
                          setState(() {
                            frontLine.add(cardData);
                          });
                        },
                      ),
                      CompleteCardLine(
                        lineTitle: 'Back line',
                        cardLine: backLine,
                        onCardsAdded: (cardData) {
                          setState(() {
                            backLine.add(cardData);
                          });
                        },
                      ),
                      CompleteCardLine(
                        lineTitle: 'Artilery',
                        cardLine: artileryLine,
                        onCardsAdded: (cardData) {
                          setState(() {
                            artileryLine.add(cardData);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: 1,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: options
                      .map(
                        (item) => Draggable<CardData>(
                          child: PlayCard(
                            cardData: item,
                          ),
                          feedback: PlayCard(
                            cardData: item,
                          ),
                          childWhenDragging: PlayCard(
                            cardData: item,
                          ),
                          data: item,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
