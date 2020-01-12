import 'package:flutter/material.dart';
import 'package:gwent_calculator/data/CardData.dart';

class PlayCard extends StatefulWidget {
  final CardData cardData;
  PlayCard({
    @required this.cardData,
  });

  @override
  _PlayCardState createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      color: Colors.transparent,
      child: new Container(
        constraints: BoxConstraints(
            // maxWidth: 200.0,
            // maxHeight: 300.0,
            minWidth: 40.0,
            minHeight: 60.0),
        decoration: new BoxDecoration(
          color: Colors.green,
          borderRadius: new BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Text(widget.cardData.value.toString()),
      ),
    );
  }
}
