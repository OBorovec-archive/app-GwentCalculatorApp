import 'package:flutter/material.dart';
import 'package:gwent_calculator/widgets/CardLine.dart';
import 'package:gwent_calculator/models/CardData.dart';
import 'package:gwent_calculator/widgets/LineWeatherIcon.dart';
import 'package:gwent_calculator/widgets/LineHornIcon.dart';

typedef Null CardAcceptCallback(CardData cardData);
typedef Null CardRemoveCallback(int cardData);

class BattleLine extends StatefulWidget {
  final String lineTitle;
  final List<CardData> cardLine;
  final String weatherIconCode;
  final CardAcceptCallback onCardsAdded;
  final CardRemoveCallback onCardRemove;

  const BattleLine({
    Key key,
    @required this.lineTitle,
    @required this.cardLine,
    @required this.weatherIconCode,
    @required this.onCardsAdded,
    @required this.onCardRemove,
  }) : super(key: key);

  @override
  _BattleLineState createState() => _BattleLineState();
}

class _BattleLineState extends State<BattleLine> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            widget.lineTitle,
            textAlign: TextAlign.center,
          ),
          Row(
            children: <Widget>[
              LineHornIcon(active: true,),
              Expanded(
                flex: 1,
                child: CardLine(
                    cards: widget.cardLine,
                    onCardsAdded: (cardData) {
                      widget.onCardsAdded(cardData);
                    },
                    onCardRemove: (idx) {
                      widget.onCardRemove(idx);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: LineWeatherIcon(
                  potencialWeatherIconCode: widget.weatherIconCode,
                ),
              ),
            ],
          ),
        ]);
  }
}
