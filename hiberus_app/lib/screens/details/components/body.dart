import 'package:flutter/material.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/models/Product.dart';
import 'package:hiberusapp/screens/details/components/cart_counter.dart';
import 'package:hiberusapp/screens/details/components/color_and_size.dart';
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
                                            ColorAndSize(product: product),
                                            Padding(
                                                padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
                                                child: Text(product.description, style: TextStyle(height: 1.5)),
                                            ),
                                            CartCounter()
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
