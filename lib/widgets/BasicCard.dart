import 'package:flutter/material.dart';
import 'package:gwent_calculator/models/CardData.dart';

class BasicCard extends StatefulWidget {
  final CardData cardData;
  BasicCard({
    @required this.cardData,
  });

  @override
  _BasicCardState createState() => _BasicCardState();
}

class _BasicCardState extends State<BasicCard> {
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
