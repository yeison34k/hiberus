import 'package:flutter/material.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/models/product.dart';
import 'package:hiberusapp/screens/details/components/color_dot.dart';

class ColorAndSize extends StatelessWidget {
    final Product product;

  const ColorAndSize({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text("Color"),
                        Row(
                            children: <Widget>[
                                ColorDot(color: Color(0xff356c95), isSeleted: true),
                                ColorDot(color: Color(0xff959323)),
                                ColorDot(color: Color(0xff674366))
                            ],
                        )
                    ],
                ),
            ),
            Expanded(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                            TextSpan(text: "Size\n"),
                            TextSpan(text: "${product.size} cm"),
                        ],
                    ),
                )
            )
        ],
        );
    }
}
