import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                                    padding: EdgeInsets.only(top: size.height * 0.10, left: kDefaultPaddin, right: kDefaultPaddin),
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
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                    CartCounter(),
                                                    Container(
                                                        padding: EdgeInsets.all(8.0),
                                                        height: 32,
                                                        width: 32,
                                                        decoration: BoxDecoration(
                                                            color: Color(0xFFFF6464),
                                                            shape: BoxShape.circle
                                                        ),
                                                        child: SvgPicture.asset("assets/icons/heart.svg"),
                                                    )
                                                ],
                                            ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
                                                child: Row(
                                                    children: <Widget>[
                                                        Container(
                                                            margin: EdgeInsets.only(right: kDefaultPaddin),
                                                            height: 50,
                                                            width: 58,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8.0),
                                                                border: Border.all(
                                                                    color: product.color
                                                                ),
                                                            ),
                                                            child: IconButton(
                                                                icon: SvgPicture.asset("assets/icons/add_to_cart.svg"),
                                                                onPressed: () {},
                                                            ),
                                                        ),
                                                        Expanded(
                                                            child: SizedBox(
                                                                height: 50,
                                                                child: FlatButton(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(18)
                                                                    ),
                                                                    color: product.color,
                                                                    onPressed: () {},
                                                                    child: Text("Buy Now".toUpperCase(),
                                                                        style: TextStyle(
                                                                            fontSize: 17,
                                                                            fontWeight: FontWeight.bold,
                                                                            color: Colors.white
                                                                        )
                                                                    ),
                                                                ),
                                                            )
                                                        )
                                                    ],
                                                ),
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
