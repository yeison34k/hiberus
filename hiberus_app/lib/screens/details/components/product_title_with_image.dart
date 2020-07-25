
import 'package:flutter/material.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/models/Product.dart';

class ProductTitleWithImage extends StatelessWidget {
    final Product product;

    const ProductTitleWithImage({Key key, this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text("Hand Bag",
                        style: TextStyle(color: Colors.white)
                    ),
                    Text(product.title,
                        style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: kDefaultPaddin,),
                    Row(
                        children: <Widget>[
                            RichText(
                                text: TextSpan(
                                    children: [
                                        TextSpan(text: "Price\n"),
                                        TextSpan(text: "\$${product.price}", style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
                                    ]
                                ),
                            ),
                            SizedBox(width: kDefaultPaddin),
                            Expanded(
                                child: Image.asset(product.image, fit: BoxFit.fill),
                            )
                        ],
                    ),
                ],
            ),
        );
    }
}