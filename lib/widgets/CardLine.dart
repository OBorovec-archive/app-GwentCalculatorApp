import 'package:flutter/material.dart';
import 'package:gwent_calculator/widgets/PlayCard.dart';
import 'package:gwent_calculator/data/CardData.dart';

typedef Null CardAcceptCallback(CardData cardData);

class CardLine extends StatefulWidget {
  final List<CardData> cards;
  final CardAcceptCallback onCardsAdded;

  CardLine({
    @required this.cards,
    @required this.onCardsAdded,
  });

  @override
  _CardLineState createState() => _CardLineState();
}

class _CardLineState extends State<CardLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      constraints: BoxConstraints(minHeight: 70.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: DragTarget<CardData>(
        builder: (BuildContext context, List candidateData, List rejectedData) {
          // In case of too many cards, use scroll view
          // TODO: Compute the threshold dynamically
          if (widget.cards.length > 5) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.cards
                    .map(
                      (item) => PlayCard(
                        cardData: item,
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.cards
                  .map(
                    (item) => PlayCard(
                      cardData: item,
                    ),
                  )
                  .toList(),
            );
          }
        },
        onAccept: (value) {
          widget.onCardsAdded(
            value,
          );
        },
      ),
    );
  }
}
