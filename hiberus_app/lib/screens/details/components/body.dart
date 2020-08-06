import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/models/product.dart';
import 'package:hiberusapp/providers/product_provider.dart';
import 'package:hiberusapp/screens/details/components/cart_counter.dart';
import 'package:hiberusapp/screens/details/components/color_and_size.dart';
import 'package:hiberusapp/screens/details/components/product_title_with_image.dart';

class Body extends StatefulWidget {
    final Product product;

    Body({Key key, this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
    ProductProvider _productProvider = ProductProvider.get();
    int _numItems = 0;

    _update(int numItems) {
        setState(() {
            _numItems = numItems;
        });
    }

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
                                            ColorAndSize(product: widget.product),
                                            Padding(
                                                padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
                                                child: Text(widget.product.description, style: TextStyle(height: 1.5)),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                    CartCounter(refresh: _update),
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
                                                                    color: widget.product.color
                                                                ),
                                                            ),
                                                            child: IconButton(
                                                                icon: SvgPicture.asset("assets/icons/add_to_cart.svg"),
                                                                onPressed: () {
                                                                    setState(() {
                                                                        widget.product.total = _numItems;
                                                                        if(_numItems > 0)
                                                                          _productProvider.insertProduct(widget.product);
                                                                    });
                                                                },
                                                            ),
                                                        ),
                                                        Expanded(
                                                            child: SizedBox(
                                                                height: 50,
                                                                child: FlatButton(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(18)
                                                                    ),
                                                                    color: widget.product.color,
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
                                ProductTitleWithImage(product: widget.product)
                            ],
                        ),
                    )
                ],
            ),
        );
    }
}
