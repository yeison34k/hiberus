import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/screens/cart/components/shopping_cart_page.dart';

class CartScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold (
            backgroundColor: Colors.white,
            appBar: _appBar(context),
            body: ShoppingCartPage(),
        );
    }

    AppBar _appBar(BuildContext context) {
        return AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                icon: SvgPicture.asset("assets/icons/back.svg", color: kTextColor,),
                onPressed: () {
                    Navigator.pop(context);
                }),
            actions: <Widget>[
                IconButton(
                    icon: SvgPicture.asset("assets/icons/search.svg", color: kTextColor),
                    onPressed: () {},
                ),
            ]
        );
    }
}