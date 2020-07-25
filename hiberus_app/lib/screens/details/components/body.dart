import 'package:flutter/material.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/models/Product.dart';
import 'package:hiberusapp/screens/details/components/product_title_with_image.dart';

class Body extends StatelessWidget {
    final Product product;

    const Body({Key key, this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        Size size  = MediaQuery.of(context).size;
        return SingleChildScrollView(
            child: Column(
                children: <Widget>[
                    SizedBox(
                        height: size.height,
                        child: Stack(
                            children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(top: size.height * 0.4),
                                    padding: EdgeInsets.only(top: size.height * 0.13, left: kDefaultPaddin, right: kDefaultPaddin),
                                    height: 500,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight:  Radius.circular(24))
                                    ),
                                    child: Column(
                                        children: <Widget>[
                                            Row(
                                                children: <Widget>[
                                                    Column(
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
                                                    RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(color: kTextColor),
                                                            children: [
                                                                TextSpan(text: "Size\n"),
                                                                TextSpan(text: "${product.size} cm"),
                                                            ],
                                                        ),
                                                    )
                                                ],
                                            )
                                        ],
                                    ),
                                ),
                                ProductTitleWithImage(product: product)
                            ],
                        ),
                    )
                ],
            ),
        );
    }

}


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
