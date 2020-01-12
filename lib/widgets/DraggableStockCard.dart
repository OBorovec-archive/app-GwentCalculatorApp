import 'package:flutter/material.dart';
import 'package:gwent_calculator/data/CardData.dart';
import 'package:gwent_calculator/widgets/BasicCard.dart';

class DraggableStockCard extends StatefulWidget {
  final int cardCountInit;
  final CardData cardData;

  const DraggableStockCard(
      {Key key, @required this.cardCountInit, @required this.cardData})
      : super(key: key);
  @override
  _DraggableStockCardState createState() => _DraggableStockCardState();
}

class _DraggableStockCardState extends State<DraggableStockCard> {
  int cardCount = 0;
  @override
  initState() {
    super.initState();
    cardCount = widget.cardCountInit;
  }

  // Widget _buildChildWhenDragging() {
  //   if (this.cardCount > 1) {
  //     return BasicCard(
  //       cardData: widget.cardData,
  //     );
  //   }
  //   return Container();
  // }

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
      onDragStarted: () {},
      onDragCompleted: () {
        this.setState(() {
          this.cardCount = this.cardCount - 1;
        });
      },
    );
  }
}
