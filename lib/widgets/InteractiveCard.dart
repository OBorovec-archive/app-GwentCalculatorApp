import 'package:flutter/material.dart';
import 'package:gwent_calculator/widgets/BasicCard.dart';
import 'package:gwent_calculator/data/CardData.dart';

enum INTERACTION_OPTIONS { remove, test }

class InteractiveCard extends StatefulWidget {
  final CardData cardData;
  final VoidCallback onRemoveCard;
  InteractiveCard({
    @required this.cardData,
    @required this.onRemoveCard,
  });
  @override
  _InteractiveCardState createState() => _InteractiveCardState();
}

class _InteractiveCardState extends State<InteractiveCard> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: BasicCard(
        cardData: widget.cardData,
      ),
      onSelected: (INTERACTION_OPTIONS result) {
        switch (result) {
          case INTERACTION_OPTIONS.remove:
            widget.onRemoveCard();
            break;
          case INTERACTION_OPTIONS.test:
            break;
        }
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<INTERACTION_OPTIONS>>[
        const PopupMenuItem<INTERACTION_OPTIONS>(
          value: INTERACTION_OPTIONS.remove,
          child: Text('Remove card'),
        ),
        const PopupMenuItem<INTERACTION_OPTIONS>(
          value: INTERACTION_OPTIONS.test,
          child: Text('Anything else?'),
        ),
      ],
    );
  }
}
