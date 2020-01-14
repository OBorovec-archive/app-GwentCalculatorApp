import 'package:flutter/material.dart';
import 'package:gwent_calculator/widgets/BattleLine.dart';
import 'package:gwent_calculator/widgets/DraggableStockCard.dart';
import 'package:gwent_calculator/models/CardData.dart';

typedef Null CardRemovecCallback(int cardIndex);

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

  void _addToLine(List<CardData> line, item) {
    setState(() {
      line.add(item);
    });
  }

  void _removeFromLine(List<CardData> line, idx) {
    setState(() {
      line.removeAt(idx);
    });
  }

  Widget _appBar() {
    return AppBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: _appBar(),
        body: Container(
          color: Colors.grey,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    BattleLine(
                      lineTitle: 'Front line',
                      cardLine: frontLine,
                      onCardsAdded: (cardData) {
                        _addToLine(frontLine, cardData);
                      },
                      onCardRemove: (idx) {
                        _removeFromLine(frontLine, idx);
                      },
                      weatherIconCode: 'wi-snow',
                    ),
                    BattleLine(
                      lineTitle: 'Back line',
                      cardLine: backLine,
                      onCardsAdded: (cardData) {
                        _addToLine(backLine, cardData);
                      },
                      onCardRemove: (idx) {
                        _removeFromLine(backLine, idx);
                      },
                      weatherIconCode: 'wi-fog',
                    ),
                    BattleLine(
                      lineTitle: 'Artilery',
                      cardLine: artileryLine,
                      onCardsAdded: (cardData) {
                        _addToLine(artileryLine, cardData);
                      },
                      onCardRemove: (idx) {
                        _removeFromLine(artileryLine, idx);
                      },
                      weatherIconCode: 'wi-rain',
                    ),
                  ],
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
                        (item) => DraggableStockCard(
                          cardCountInit: 2,
                          cardData: item,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          onPressed: () {},
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
          heroTag: 'gwent_icon',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
