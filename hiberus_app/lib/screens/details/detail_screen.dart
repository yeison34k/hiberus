import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiberusapp/screens/cart/cart.dart';
import 'package:hiberusapp/screens/details/components/body.dart';
import 'package:hiberusapp/models/product.dart';

class DetailScreen extends StatelessWidget {
    final Product product;

    const DetailScreen({Key key, this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: product.color,
            appBar: _appBar(context),
            body: Body(product: product),
        );
    }

    AppBar _appBar(BuildContext context) {
        return AppBar(
            backgroundColor: product.color,
            elevation: 0,
            leading: IconButton(
                icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white,),
                onPressed: () {
                    Navigator.pop(context);
                }),
            actions: <Widget>[
                IconButton(
                    icon: SvgPicture.asset("assets/icons/search.svg", color: Colors.white),
                    onPressed: () {},
                ),
                IconButton(
                    icon: SvgPicture.asset("assets/icons/cart.svg", color: Colors.white),
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                    },
                )
            ]
        );
    }
}
