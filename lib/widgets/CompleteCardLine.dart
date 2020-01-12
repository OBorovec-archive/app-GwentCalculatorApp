import 'package:flutter/material.dart';
import 'package:gwent_calculator/widgets/CardLine.dart';
import 'package:gwent_calculator/data/CardData.dart';

typedef Null CardAcceptCallback(CardData cardData);
typedef Null CardRemoveCallback(int cardData);

class CompleteCardLine extends StatefulWidget {
  final String lineTitle;
  final List<CardData> cardLine;
  final CardAcceptCallback onCardsAdded;
  final CardRemoveCallback onCardRemove;

  const CompleteCardLine(
      {Key key,
      this.lineTitle,
      this.cardLine,
      this.onCardsAdded,
      this.onCardRemove})
      : super(key: key);

  @override
  _CompleteCardLineState createState() => _CompleteCardLineState();
}

class _CompleteCardLineState extends State<CompleteCardLine> {
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
              Icon(
                Icons.favorite,
                color: Colors.black,
              ),
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
              Icon(
                Icons.favorite,
                color: Colors.black,
              ),
            ],
          ),
        ]);
  }
}
