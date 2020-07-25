import 'package:flutter/material.dart';
import 'package:hiberusapp/constants.dart';

class ColorDot extends StatelessWidget {
    final Color color;
    final bool isSeleted;

    const ColorDot({Key key, this.color, this.isSeleted = false}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.only(top: kDefaultPaddin / 4, right: kDefaultPaddin / 2),
            padding: EdgeInsets.all(2.5),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isSeleted ? color : Colors.transparent
                )
            ),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color
                ),
            ),
        );
    }
}