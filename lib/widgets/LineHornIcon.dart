import 'package:flutter/material.dart';

class LineHornIcon extends StatelessWidget {
  final bool active;

  const LineHornIcon({Key key, this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      color: active ? Colors.white : Colors.black,
      icon: Icon(
        Icons.accessibility_new,
        color: active ? Colors.black : Colors.white,
      ),
    );
  }
}
