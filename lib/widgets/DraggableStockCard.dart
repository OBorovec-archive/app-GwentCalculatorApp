import 'package:flutter/material.dart';
import 'package:gwent_calculator/data/CardData.dart';
import 'package:gwent_calculator/widgets/BasicCard.dart';


class DraggableStockCard extends StatefulWidget {
  final int cardCount;
  final CardData cardData;

  const DraggableStockCard({Key key, @required this.cardCount, @required this.cardData})
      : super(key: key);
  @override
  _DraggableStockCardState createState() => _DraggableStockCardState();
}

class _DraggableStockCardState extends State<DraggableStockCard> {
  @override
  Widget build(BuildContext context) {
    return Draggable<CardData>(
      child: BasicCard(
        cardData: widget.cardData,
      ),
      feedback: BasicCard(
        cardData: widget.cardData,
      ),
      childWhenDragging: BasicCard(
        cardData: widget.cardData,
      ),
      data: widget.cardData,
    );
  }
}
